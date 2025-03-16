using PersonnelManager.Controller.API;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PersonnelManager.View.Partial.WorkerCardWindow
{
    /// <summary>
    /// Логика взаимодействия для WorkerCardFillData.xaml
    /// </summary>
    public partial class WorkerCardFillData : UserControl
    {
        public WorkerCardFillData()
        {
            InitializeComponent();
            EditMode(false);
        }
        private void EditMode(bool IsEnable)
        {
            EditData.Content = IsEnable ? "Отменить редактироваине" : "Редактировать данные";

            TBFirstName.IsEnabled = IsEnable;
            TBLastName.IsEnabled = IsEnable;
            TBMiddleName.IsEnabled = IsEnable;
            TBWorkPhoneNumber.IsEnabled = IsEnable;
            TBPersonalPhoneNumber.IsEnabled = IsEnable;
            DPBirthDate.IsEnabled = IsEnable;
            ComboBoxDepartments.IsEnabled = IsEnable;
            ComboBoxPosts.IsEnabled = IsEnable;
            ComboBoxLeaders.IsEnabled = IsEnable;
            ComboBoxHelpers.IsEnabled = IsEnable;
            TBCabinet.IsEnabled = IsEnable;
            TBEmail.IsEnabled = IsEnable;
            TBExtraInfo.IsEnabled = IsEnable;
        }

        public void InitializeComboBoxDepartments()
        {
            Worker worker = (Worker)DataContext;
            List<string> departmentsNames = new List<string>();
            List<Department> departments = DepartmentsController.GetDepartments();
            foreach (var department in departments)
            {
                departmentsNames.Add(department.Name);
            }

            List<Department> depList = DepartmentsController.GetDepartments().Where(x => x.Id == worker.DepartmentId).ToList();

            ComboBoxDepartments.ItemsSource = departmentsNames;
            ComboBoxDepartments.SelectedItem = depList[0].Name;
        }

        public void InitializeComboBoxPosts()
        {
            Worker worker = (Worker)DataContext;
            List<string> postsNames = new List<string>();
            List<Post> posts = PostsController.GetPosts();
            foreach (var post in posts)
            {
                postsNames.Add(post.Name);
            }

            List<Post> postList = PostsController.GetPosts().Where(x => x.Id == worker.PostId).ToList();

            ComboBoxPosts.ItemsSource = postsNames;
            ComboBoxPosts.SelectedItem = postList[0].Name;
        }

        public void InitializeComboBoxLeaders()
        {
            Worker worker = (Worker)DataContext;

            List<string> colleguesNamesList = new List<string>();
            foreach (var collegue in worker.Colleagues)
            {
                colleguesNamesList.Add(collegue.FullName);
            }

            List<Worker> workersList = WorkersController.GetWorkers().Where(x => x.Id == worker.LeaderId).ToList();

            ComboBoxLeaders.ItemsSource = colleguesNamesList;
            if (workersList.Count != 0)
                ComboBoxLeaders.SelectedItem = workersList[0].FullName;
        }

        public void InitializeComboBoxHelpers()
        {
            Worker worker = (Worker)DataContext;

            List<string> colleguesNamesList = new List<string>();
            foreach (var collegue in worker.Colleagues)
            {
                colleguesNamesList.Add(collegue.FullName);
            }

            List<Worker> workersList = WorkersController.GetWorkers().Where(x => x.Id == worker.HelperId).ToList();

            ComboBoxHelpers.ItemsSource = colleguesNamesList;
            if (workersList.Count != 0)
                ComboBoxHelpers.SelectedItem = workersList[0].FullName;
        }

        private void TBWorkPhoneNumber_TextChanged(object sender, TextChangedEventArgs e)
        {
            string allowedChars = "0123456789+()- #";
            TBWorkPhoneNumber.Text = new string(TBWorkPhoneNumber.Text.Where(c => allowedChars.Contains(c)).ToArray());
            TBWorkPhoneNumber.SelectionStart = TBWorkPhoneNumber.Text.Length;
        }

        private void TBPersonalPhoneNumber_TextChanged(object sender, TextChangedEventArgs e)
        {
            string allowedChars = "0123456789+()- #";
            TBPersonalPhoneNumber.Text = new string(TBPersonalPhoneNumber.Text.Where(c => allowedChars.Contains(c)).ToArray());
            TBPersonalPhoneNumber.SelectionStart = TBPersonalPhoneNumber.Text.Length;
        }

        private void ButtonFireWorker_Click(object sender, RoutedEventArgs e)
        {
            Worker worker = (Worker)DataContext;
            worker.Training = TrainingsController.GetTrainingCalendarsByWorkerId(worker.Id);

            if (worker.Training.Count != 0)
            {
                foreach (var training in worker.Training)
                {
                    var targetDate = training.EndDate.Value;
                    var currentDate = DateTime.Now;
                    var difference = DateTime.Compare(targetDate, currentDate);
                    if (difference > 0)
                    {
                        MessageBox.Show($"Невозможно удалить сотрудника: {worker.FullName}. Из-за предстоящих обучениий", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                }
            }

            var answer = MessageBox.Show($"Удалить сотрудника: {worker.FullName}?", "Удаление сотрудника", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (answer == MessageBoxResult.OK)
            {
                //WorkersController.DeleteWorker(worker.Id); //????????
                MessageBox.Show($"Сотрудник удалён!", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else if (answer == MessageBoxResult.Cancel)
            {
                return;
            }
        }
        private void ButtonSaveChanges_Click(object sender, RoutedEventArgs e)
        {

            Worker worker = (Worker)DataContext;

            worker.FirstName = TBFirstName.Text;
            worker.LastName = TBLastName.Text;
            worker.MiddleName = TBMiddleName.Text;

            worker.WorkPhoneNumber = TBWorkPhoneNumber.Text;
            worker.PersonalPhoneNumber = TBPersonalPhoneNumber.Text;

            worker.BirthDate = DateTime.Parse(DPBirthDate.Text);

            /*  worker.DepartmentId;
              worker.Post;
              worker.LeaderId;
              worker.HelperId;*/

            //worker.Cabinet = TBCabinet.Text;
            worker.CorporateEmail = TBEmail.Text;
            worker.ExtraInfo = TBExtraInfo.Text;

            //worker.DepartmentId = DepartmentsController.get

            //var result = TEMPmethod(worker);

            //string result = WorkersController.UpdateWorker(worker.Id, worker) ? "Изменения сохранены!" : "Не удалось сохранить изменения!";
            //MessageBox.Show(result);
            MessageBox.Show("IN PROGRESS");
        }

        /*public async string TEMPmethod(Worker worker)
        {
            return JsonConvert.SerializeObject(worker);
        }*/

        private bool IsEditMode = false;
        private void EditData_Click(object sender, RoutedEventArgs e)
        {
            EditMode(!IsEditMode);
            IsEditMode = !IsEditMode;
        }

        private void ButtonCreateCheckList_Click(object sender, RoutedEventArgs e)
        {
            Worker worker = (Worker)DataContext;
            //WordCheckList checkList = new WordCheckList(worker.FullName);

            /* checkList.Create(
                 !string.IsNullOrEmpty(worker.PersonalPhoneNumber),
                 !string.IsNullOrEmpty(worker.WorkPhoneNumber),
                 !string.IsNullOrEmpty(worker.CorporateEmail)
                 );

             MessageBox.Show(checkList.SaveAsPDF() ? "Чек-лист файл сохранён!" : "Не удалось сохранить Чек-лист файл!");*/
        }
    }
}
