using GreenslateChallenge.Data;
using GreenslateChallenge.Interfaces.Projects;
using GreenslateChallenge.Interfaces.Users;
using GreenslateChallenge.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace GreenslateChallenge.Controllers
{
    public class ProjectsController : Controller
    {
        private readonly ProjectsContext _context;
        private readonly IProjectService _project_service;
        private readonly IUserService _user_service;

        public ProjectsController(ProjectsContext context, IProjectService projectService, IUserService userService)
        {
            _context = context;
            _project_service = projectService;
            _user_service = userService;
        }

        /// <summary>
        /// When the user enter the application, it enter here
        /// It call the user service to generate a UserViewModel
        /// which have the information that we need to do the initial
        /// query to create the dropdown of the users.
        /// </summary>
        /// <returns>The view that is going to be presented</returns>
        [HttpGet]
        public IActionResult Index()
        {
            return View(_user_service.GetUsersData());
        }


        /// <summary>
        /// When a user is selected in the dropdown, this is the method that is called from the Ajax function
        /// It receive a userId as parameter, and it call the project service which will call the repository
        /// that have all the logic to do the required query to the database.
        /// </summary>
        /// <param name="userId">The Id of the user that we want to show the information</param>
        /// <returns>A ChartViewModel that have all the query information on it on json form </returns>
        [HttpPost]
        public JsonResult QueryUserInformation(string userId) 
        {
            var chartInformationViewModel = _project_service.GetUserInformation(userId);
            return Json(chartInformationViewModel);
        }
    }
}
