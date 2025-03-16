using PersonnelManager.Controller.API;
using PersonnelManager.Model;
using PersonnelManager.View.Partial.DataCards;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PersonnelManager.View.Partial
{
    /// <summary>
    /// Логика взаимодействия для OrganizationStructure.xaml
    /// </summary>
    public partial class OrganizationStructure : UserControl
    {
        private List<Department> departments = new List<Department>();
        private Dictionary<int, List<Department>> departmentStructureByLevels;
        public OrganizationStructure()
        {
            InitializeComponent();
            departments = DepartmentsController.GetDepartments();
            BuildDepartmentHierarchy();
            InitializeDepartmentLevels();

            DrawStructure();
        }

        private void BuildDepartmentHierarchy()
        {
            var departmentDict = departments.ToDictionary(d => d.Id);


            foreach (var department in departments)
            {
                department.ChildDepartments = new List<Department>();
            }


                foreach (var department in departments)
            {
                if (departmentDict.ContainsKey(department.ParentId))
                {
                    var parentDepartment = departmentDict[department.ParentId];

                    parentDepartment.ChildDepartments.Add(department);
                }
            }
        }
        private void InitializeDepartmentLevels()
        {
            departmentStructureByLevels = new Dictionary<int, List<Department>>();

            foreach (var department in departments)
            {
                int level = department.ParentId;
                if (!departmentStructureByLevels.ContainsKey(level))
                {
                    departmentStructureByLevels[level] = new List<Department>();
                }

                departmentStructureByLevels[level].Add(department);
            }
        }
        private void DrawStructure()
        {
            int counter = 0;

            foreach (var item in departmentStructureByLevels)
            {
                StackPanel stackPanel = new StackPanel
                {
                    Orientation = Orientation.Horizontal,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    Name = $"StackPanelDepartmentLine_{counter}"
                };

                stackPanel.MouseLeftButtonDown += StackPanel_MouseLeftButtonDown;

                foreach (var department in item.Value)
                {
                    DepartmentCard element = new DepartmentCard
                    {
                        Tag = department,
                        DepartmentName = { Text = department.Name },
                    };

                    element.MouseLeftButtonDown += Element_MouseLeftButtonDown;

                    element.MouseEnter += (sender, e) =>
                    {
                        element.Rectangle.Background = new SolidColorBrush(Colors.LimeGreen);
                    };

                    element.MouseLeave += (sender, e) =>
                    {
                        element.Rectangle.Background = new SolidColorBrush(Colors.PaleGreen);
                    };

                    department.VisualCard = element;
                    stackPanel.Children.Add(department.VisualCard);

                }

                GridDepartmentStructure.RowDefinitions.Add(new RowDefinition());
                Grid.SetRow(stackPanel, counter);
                GridDepartmentStructure.Children.Add(stackPanel);
                //DrawLines();
                counter++;
            }
        }
        public void DrawLines()
        {
            foreach (var level in departmentStructureByLevels)
            {
                foreach (var department in level.Value)
                {
                    //if(department.Id == )
                    var parentLocation = department.VisualCard.PointToScreen(new Point(0, 0));
                    Size parentSize = new Size(department.VisualCard.ActualWidth, department.VisualCard.ActualHeight);

                    foreach (var child in department.ChildDepartments)
                    {
                        var childLocation = child.VisualCard.PointToScreen(new Point(0, 0));
                        Size childSize = new Size(child.VisualCard.ActualWidth, child.VisualCard.ActualHeight);

                        Line line = new Line()
                        {
                            Stroke = Brushes.Black, // CHANGE
                            X1 = parentLocation.X + parentSize.Width / 2,
                            Y1 = parentLocation.Y - parentSize.Height,

                            X2 = childLocation.X + childSize.Width / 2,
                            Y2 = childLocation.Y - childSize.Height,

                            StrokeThickness = 2
                        };

                        CanvasLine.Children.Add(line);
                    }
                }
            }
        }

        private void Element_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var department = ((Control)sender).Tag as Department;

            //List<Worker> workers = (List<Worker>)WorkersController.GetWorkers();
            List<Worker> SortedWorkers = FindAllChildDepartmentWorkers(department);

            App.drawWorkersDelegate(SortedWorkers);

            //FindChildren(department);
        }
        List<Worker> FindAllChildDepartmentWorkers(Department department)
        {
            List<Worker> AllChildWorkers = new List<Worker>();
            List<Worker> workers = WorkersController.GetWorkers();

            AllChildWorkers = workers.Where(x => x.DepartmentId == department.Id).ToList();

            foreach (var ChildDepartment in department.ChildDepartments)
            {
                AllChildWorkers.AddRange(FindAllChildDepartmentWorkers(ChildDepartment));
            }

            return AllChildWorkers;
        }
        private void StackPanel_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            StackPanel activeElement = sender as StackPanel;
            //MessageBox.Show(activeElement.Name.ToString());
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            DrawLines();
        }
    }
}