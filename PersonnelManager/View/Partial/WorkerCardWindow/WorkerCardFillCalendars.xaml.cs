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
    /// Логика взаимодействия для WorkerCardFillCalendars.xaml
    /// </summary>
    public partial class WorkerCardFillCalendars : UserControl
    {
        const int ABSENCE_TYPE_ID_VACATION = 1;
        public WorkerCardFillCalendars()
        {
            InitializeComponent();
        }
        public void InitializeTrainingListView()
        {
            Worker worker = (Worker)DataContext;
            List<Training> trainingCalendars = TrainingsController.GetTrainings().Where(training => training.WorkerId == worker.Id).ToList();
            foreach (var calendar in trainingCalendars)
            {
                TrainingListView.Items.Add($"\"{calendar.TrainingName}\" Тип: {(TrainingTypesController.GetTrainingTypeById(calendar.TypeId)).Name}" +
                    $"({calendar.StartDate.Value.ToString("dd.MM.yyyy")}-{calendar.EndDate.Value.ToString("dd.MM.yyyy")})");
            }
        }

        public void InitializeDayOffListView()
        {
            Worker worker = (Worker)DataContext;
            List<Absence> lackCalendars = AbsencesController.GetAbsenceCalendarsByWorkerId(worker.Id)
                .Where(x => x.TypeId != ABSENCE_TYPE_ID_VACATION).ToList();
            foreach (var calendar in lackCalendars)
            {
                DayOffListView.Items.Add($"({calendar.StartDate.Value.ToString("dd.MM.yyyy")}-{calendar.EndDate.Value.ToString("dd.MM.yyyy")})" +
                    $" Причина: {(AbsenceTypesController.GetAbsenceTypeById(calendar.TypeId)).Name}");
            }
        }

        public void InitializeVacationListView()
        {
            Worker worker = (Worker)DataContext;
            List<Absence> vacationCalendars = AbsencesController.GetAbsenceCalendarsByWorkerId(worker.Id)
                .Where(x => x.TypeId == ABSENCE_TYPE_ID_VACATION).ToList();
            foreach (var calendar in vacationCalendars)
            {
                VacationListView.Items.Add($"({calendar.StartDate.Value.ToString("dd.MM.yyyy")}-{calendar.EndDate.Value.ToString("dd.MM.yyyy")})");
            }
        }


        private void ButtonDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            string deletedElement = "";

            if (TrainingListView.SelectedItem != null)
            {

                //deletedElement = TrainingListView.SelectedItem

            }
            else if (DayOffListView.SelectedItem != null)
            {

            }
            else if (VacationListView.SelectedItem != null)
            {

            }
            else
            {
                MessageBox.Show("Сначала выберите элемент для удаления!");
                return;
            }
            MessageBox.Show($"Элемент {deletedElement} успешно удалён!");
        }

        private void ButtonAdd_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            FillCalendarWindow window = new FillCalendarWindow();
            window.ShowDialog();
        }


        /*public void InitializeVacationCalendars()
        {
            Worker worker = (Worker)DataContext;
            List<AbsenceCalendar> vacationCalendars = AbsenceCalendarController.GetVacationCalendar().Where(x => x.WorkerId == worker.Id).ToList();
            if (vacationCalendars.Count != 0)
            {
                foreach (var item in vacationCalendars)
                {
                    CalendarDateRange vacationRange = new CalendarDateRange();

                    vacationRange.Start = (DateTime)item.StartAbsenceDate;
                    vacationRange.End = (DateTime)item.EndAbsenceDate;

                    CalendarVacation.BlackoutDates.Add(vacationRange);
                }
            }
        }*/
    }
}
