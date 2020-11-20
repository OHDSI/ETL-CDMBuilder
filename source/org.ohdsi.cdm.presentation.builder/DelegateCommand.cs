using System;
using System.Windows.Input;

namespace org.ohdsi.cdm.presentation.builder
{
    public class DelegateCommand : ICommand
    {
        private readonly Action _action;
        private readonly Func<bool> _canExecute;

        public DelegateCommand(Action action, Func<bool> canExecute)
        {
            _action = action;
            _canExecute = canExecute;
        }

        public DelegateCommand(Action action)
        {
            _action = action;
        }

        public void Execute(object parameter)
        {
            _action();
        }

        public bool CanExecute(object parameter)
        {
            return _canExecute == null || _canExecute();
        }

        public event EventHandler CanExecuteChanged;
    }
}
