using PersonnelManager.Model;
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
using System.Windows.Shapes;

namespace PersonnelManager.View.Partial.WorkerCardWindow
{
    /// <summary>
    /// Логика взаимодействия для WorkerCardWindow.xaml
    /// </summary>
    public partial class WorkerCardWindow : Window
    {
        public WorkerCardWindow()
        {
            InitializeComponent();
        }

        public WorkerCardWindow(object workerObject)
        {
            Worker worker = workerObject as Worker;
            DataContext = worker;

            /*            Loaded += (object sender, RoutedEventArgs e) =>
                        {
                            userDataFillElement.DataContext = this.DataContext;
                        };*/

            InitializeComponent();

            WorkerCardFillData.DataContext = this.DataContext;
            WorkerCardFillData.InitializeComboBoxDepartments();
            WorkerCardFillData.InitializeComboBoxPosts();
            WorkerCardFillData.InitializeComboBoxLeaders();
            WorkerCardFillData.InitializeComboBoxHelpers();

            WorkerCardFillCalendars.DataContext = this.DataContext;
            //userDataFillCalendar.InitializeVacationCalendars();
            WorkerCardFillCalendars.InitializeTrainingListView();
            WorkerCardFillCalendars.InitializeDayOffListView();

            MessageBox.Show(worker.FullName);
        }
    }
}
