using PersonnelManager.Model;
using System.Configuration;
using System.Data;
using System.Windows;

namespace PersonnelManager;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App : Application
{
    public delegate void DrawWorkersByDepartment(List<Worker> workers);
    public static DrawWorkersByDepartment drawWorkersDelegate;
}

