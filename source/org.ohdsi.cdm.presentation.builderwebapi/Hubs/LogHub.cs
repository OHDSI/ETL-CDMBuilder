using Microsoft.AspNetCore.SignalR;
using System;
using System.Threading.Tasks;

namespace org.ohdsi.cdm.presentation.builderwebapi.Hubs
{
    public class LogHub : Hub
    {
        public override Task OnConnectedAsync()
        {
            //
            var authorization = Context.GetHttpContext().Request.Query["Authorization"].ToString();
            Groups.AddToGroupAsync(this.Context.ConnectionId, authorization).Wait();
            

            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            var authorization = Context.GetHttpContext().Request.Query["Authorization"].ToString();
            Groups.RemoveFromGroupAsync(this.Context.ConnectionId, authorization).Wait();

            return base.OnDisconnectedAsync(exception);
        }

    }
}
