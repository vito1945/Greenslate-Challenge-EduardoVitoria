using GreenslateChallenge.Data;
using GreenslateChallenge.Interfaces.Users;
using GreenslateChallenge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Repositories.Users
{
    public class UserRepository : IUserRepository
    {
        private readonly ProjectsContext _context;
        public UserRepository(ProjectsContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Queries the database to get the name of the users and its Id's.
        /// </summary>
        /// <returns>A Users View Model that contains the list of names and Id's</returns>
        public UsersViewModel GetUserData()
        {
            var userInformation = from prueba in _context.User
                                  select new { Name = prueba.FirstName + " " + prueba.LastName, UserId = prueba.Id };

            var usersVM = new UsersViewModel
            {
                FirstNames = userInformation.ToList().Select(i => i.Name.ToString()).ToList(),
                Ids = userInformation.ToList().Select(i => i.UserId).ToList()
            };
            return usersVM;
        }
    }
}
