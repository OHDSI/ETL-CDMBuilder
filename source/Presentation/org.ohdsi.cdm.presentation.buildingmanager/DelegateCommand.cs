using System;
using System.Windows.Input;

namespace org.ohdsi.cdm.presentation.buildingmanager
{
   public class DelegateCommand : ICommand
   {
      private readonly Action action;
      private readonly Func<bool> canExecute;

      public DelegateCommand(Action action, Func<bool> canExecute)
      {
         this.action = action;
         this.canExecute = canExecute;
      }

      public DelegateCommand(Action action)
      {
         this.action = action;
      }

      public void Execute(object parameter)
      {
         action();
      }

      public bool CanExecute(object parameter)
      {
         return canExecute == null || canExecute();
      }

      public event EventHandler CanExecuteChanged;
   }
}
