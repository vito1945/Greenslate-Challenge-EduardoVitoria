using GreenslateChallenge.Interfaces;
using GreenslateChallenge.Interfaces.Projects;
using GreenslateChallenge.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Services.Projects
{
    public class ProjectService : IProjectService
    {

        private readonly IProjectRepository _project_repository;

        public ProjectService(IProjectRepository repository) 
        {
            _project_repository = repository;
        }

        public ChartInformationViewModel GetUserInformation(string userId)
        {
            return _project_repository.GetUserInformation(userId);
        }
    }
}
