 using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PersonnelManager;

public partial class MainWindow : Window
{
    public MainWindow()
    {
        try
        {
            //Проверка подключения
        }
        catch
        {
            MessageBox.Show("Невозможно установить соединение с сервером!\nПовторите попытку входа позже.", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            Environment.Exit(-1);
        }

        InitializeComponent();
        MainFrame.Navigate(new Uri("View\\MainPage.xaml", UriKind.Relative));
    }
}