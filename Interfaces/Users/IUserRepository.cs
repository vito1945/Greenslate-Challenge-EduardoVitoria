using GreenslateChallenge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Interfaces.Users
{
    public interface IUserRepository
    {
        UsersViewModel GetUserData();
    }
}
