using org.ohdsi.cdm.presentation.builder;
using System.Windows;
using System.Windows.Controls;

namespace org.ohdsi.cdm.presentation.builder
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private readonly BuilderViewModel _vm;
        public MainWindow()
        {
            InitializeComponent();

            _vm = new BuilderViewModel();
            DataContext = _vm;

            ((PasswordBox)this.FindName("sourcePswd")).Password = _vm.SourcePswd;
            ((PasswordBox)this.FindName("cdmPswd")).Password = _vm.CdmPswd;
            ((PasswordBox)this.FindName("vocabPswd")).Password = _vm.VocabPswd;


            var s = new Style();
            s.Setters.Add(new Setter(VisibilityProperty, Visibility.Collapsed));
            tabControl.ItemContainerStyle = s;
            tabControl.SelectedIndex = 0;
            tabControl.SelectionChanged += TabControl_SelectionChanged;

            this.Closing += MainWindow_Closing;
        }

        private void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //if (e.Source is TabControl && Settings.Settings.Current != null)
            //{
            //    _vm?.UpdateState();
            //    Settings.Settings.Current.Load();
            //}
        }

        private void PasswordBox_OnPasswordChanged(object sender, RoutedEventArgs e)
        {
            var pswdBox = (PasswordBox)sender;

            if (pswdBox.Name == "cdmPswd")
            {
                _vm.CdmPswd = pswdBox.Password;
            }
            else if (pswdBox.Name == "sourcePswd")
            {
                _vm.SourcePswd = pswdBox.Password;
            }
            else if (pswdBox.Name == "vocabPswd")
            {
                _vm.VocabPswd = pswdBox.Password;
            }
        }

        void MainWindow_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            _vm.Stop();
        }
    }
}
