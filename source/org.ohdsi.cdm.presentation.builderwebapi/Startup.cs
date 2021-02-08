using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Server.IISIntegration;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using org.ohdsi.cdm.presentation.builderwebapi.Hubs;
using System;
using System.Net;

namespace org.ohdsi.cdm.presentation.builderwebapi
{
    public class Startup
    {
        readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddCors();

            services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.KnownProxies.Add(IPAddress.Parse("10.110.1.7"));
                options.KnownProxies.Add(IPAddress.Parse("185.134.75.47"));
             });

            services.AddCors(options =>
            {
                options.AddPolicy(MyAllowSpecificOrigins,
                builder =>
                {
                    builder
                    .SetIsOriginAllowedToAllowWildcardSubdomains()
                    .WithOrigins("http://cdmwizard.arcadialab.ru",
                                        "http://185.134.75.47", 
                                        "http://185.134.75.47:9000", 
                                        "http://cdmwizard.arcadialab.ru:9000",
                                        "http://localhost:9000",
                                        "http://10.110.1.7:8080",
                                        "http://10.110.1.7")
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowCredentials();
                });
            });

            services.AddControllers();
            services.AddSignalR().AddHubOptions<LogHub>(options =>
            {
                options.EnableDetailedErrors = true;
            });

            services.AddHostedService<QueuedHostedService>();
            services.AddSingleton<IBackgroundTaskQueue, BackgroundTaskQueue>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseForwardedHeaders(new ForwardedHeadersOptions
            {
                ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
            });
            app.UseCors(MyAllowSpecificOrigins);

            //app.UseCors(builder => builder
            //    .AllowAnyHeader()
            //    .AllowAnyMethod()
            //    .SetIsOriginAllowed((host) => true)
            //    .AllowCredentials()
            //);

            //app.UseHttpsRedirection();

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHub<LogHub>("/log");
                endpoints.MapControllers();
            });
        }
    }
}
