using PersonnelManager.Controller.API;
using PersonnelManager.Model;
using PersonnelManager.View.Partial.DataCards;
using PersonnelManager.View.Partial.WorkerCardWindow;
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
    /// Логика взаимодействия для WorkersList.xaml
    /// </summary>
    public partial class WorkersList : UserControl
    {
        public WorkersList()
        {
            InitializeComponent();
            var workers = WorkersController.GetWorkers();
            App.drawWorkersDelegate += DrawWorkerList;
            //DrawWorkerList(workers);
        }

        public void DrawWorkerList(List<Worker> workers)
        {
            //workers.Sort();
            StackPanelUsersList.Children.Clear();
            foreach (var worker in workers)
            {
                WorkerCard userDataCard = new WorkerCard();
                {
                    List<Department> depList = DepartmentsController.GetDepartments().Where(x => x.Id == worker.DepartmentId).ToList();
                    List<Post> postList = PostsController.GetPosts().Where(x => x.Id == worker.PostId).ToList();

                    if (depList.Count != 0)
                        userDataCard.LabelDepartment.Content = depList[0].Name;
                    if (postList.Count != 0)
                        userDataCard.LabelPost.Content = postList[0].Name;



                    userDataCard.LabelFullName.Content = worker.FullName;
                    userDataCard.LabelPhoneNumber.Content = worker.WorkPhoneNumber;
                    userDataCard.LabelEmail.Content = worker.CorporateEmail;
                    userDataCard.labelCabinet.Content = worker.Cabinet;
                }
                userDataCard.Margin = new Thickness(20, 20, 20, 20);

                worker.Colleagues = WorkersController.GetWorkers().Where(w => w.DepartmentId == worker.DepartmentId).ToList();


                userDataCard.Tag = worker;
                userDataCard.MouseLeftButtonDown += UserDataCard_MouseLeftButtonDown;

                userDataCard.MouseEnter += (object sender, MouseEventArgs e) =>
                {
                    userDataCard.Rectangle.Background = new SolidColorBrush(Colors.LimeGreen);

                };

                userDataCard.MouseLeave += (object sender, MouseEventArgs e) =>
                {
                    userDataCard.Rectangle.Background = new SolidColorBrush(Colors.PaleGreen);
                };

                StackPanelUsersList.Children.Add(userDataCard);
            }
        }



        private void UserDataCard_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            WorkerCardWindow.WorkerCardWindow userCardModalWindow = new WorkerCardWindow.WorkerCardWindow(((Control)sender).Tag);
            userCardModalWindow.ShowDialog();
        }
    }
}
