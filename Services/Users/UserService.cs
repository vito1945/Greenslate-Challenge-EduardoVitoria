using GreenslateChallenge.Interfaces.Users;
using GreenslateChallenge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Services.Users
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _user_repository;

        public UserService(IUserRepository repository)
        {
            _user_repository = repository;
        }
        public UsersViewModel GetUsersData()
        {
            return _user_repository.GetUserData();
        }
    }
}
