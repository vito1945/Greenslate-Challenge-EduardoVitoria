using GreenslateChallenge.Data;
using GreenslateChallenge.Interfaces.Projects;
using GreenslateChallenge.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Repositories.Projects
{
    public class ProjectRepository : IProjectRepository
    {
        private readonly ProjectsContext _context;

        public ProjectRepository(ProjectsContext context) 
        {
            _context = context;
        }

        /// <summary>
        /// It receive the user Id of the person that we want to see its project information.
        /// All the information is saved on a view model that is going to be returned to the Controller
        /// to present it on the screen.
        /// </summary>
        /// <param name="userId">The Id of the user that we want to show the information</param>
        /// <returns>A ChartViewModel that have all the query information</returns>
        public ChartInformationViewModel GetUserInformation(string userId)
        {
            var projectsAssignedToUserQuery = from projectsAssignedToUser in _context.UserProject
                                              where projectsAssignedToUser.UserId == Int32.Parse(userId)
                                              select new { ID = projectsAssignedToUser.ProjectId, IsActive = projectsAssignedToUser.IsActive, AssignedDates = projectsAssignedToUser.AssignedDate };

            var projectsIds = new List<int>();
            var projectStartDateList = new List<DateTime>();
            var projectEndDateList = new List<DateTime>();
            var creditList = new List<int>();
            var assignedDates = new List<DateTime>();
            var activeList = new List<bool>();

            foreach (var project in projectsAssignedToUserQuery.ToList())
            {
                var theQuery = from projectStartDate in _context.Project
                               where projectStartDate.Id == project.ID
                               select new { StartDates = projectStartDate.StartDate, EndDates = projectStartDate.EndDate, Credits = projectStartDate.Credits };

                projectsIds.Add(project.ID);
                projectStartDateList.Add(theQuery.SingleOrDefault().StartDates);
                projectEndDateList.Add(theQuery.SingleOrDefault().EndDates);
                creditList.Add(theQuery.SingleOrDefault().Credits);
                assignedDates.Add(project.AssignedDates);
                activeList.Add(project.IsActive);
            }
            var chartInformationViewModel = new ChartInformationViewModel();
            chartInformationViewModel.ProjectsIds = projectsIds;
            chartInformationViewModel.StartDates = projectStartDateList;
            chartInformationViewModel.TimeToStart = CalculateTimeToStart(projectStartDateList, assignedDates);
            chartInformationViewModel.EndDates = projectEndDateList;
            chartInformationViewModel.Credits = creditList;
            chartInformationViewModel.isActive = CalculateIfIsActive(activeList);

            return chartInformationViewModel;
        }

        /// <summary>
        /// This is a helper method that calculate how much days are left to the employee
        /// to start working on a project. If the amount of days is minor than cero, it means
        /// that the project was already started and it will display "Started"
        /// </summary>
        /// <param name="startDates">The start date of a project</param>
        /// <param name="assignedDates">Date in which the person is scheduled to start working on the project</param>
        /// <returns>The amount of days left to start working on the project</returns>
        private List<string> CalculateTimeToStart(List<DateTime> startDates, List<DateTime> assignedDates)
        {
            var daysToStart = new List<string>();
            var counter = 0;
            foreach (var startDate in startDates)
            {
                var daysDifference = assignedDates[counter] - startDate;
                if (daysDifference.Days >= 0)
                {
                    daysToStart.Add(daysDifference.Days.ToString());
                }
                else
                {
                    daysToStart.Add("Started");
                }
                counter++;
            }
            return daysToStart;
        }

        /// <summary>
        /// This is a helper method that calculate if a user is active or not in a project. We
        /// do this method because we need to display the String "Active" or "Inactive" according
        /// to the boolean value received.
        /// </summary>
        /// <param name="activeList">The list of booleans that indicate if a person is active or not in a project</param>
        /// <returns>The list of strings that contain the Active or Inactive strings</returns>
        private List<string> CalculateIfIsActive(List<bool> activeList)
        {
            var activeListStrings = new List<string>();
            foreach (var isActive in activeList)
            {
                if (isActive)
                {
                    activeListStrings.Add("Active");
                }
                else
                {
                    activeListStrings.Add("Inactive");
                }
            }
            return activeListStrings;
        }
    }
}
