using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Models
{
    public class UserProject
    {
        [Key]
        public int UserId { get; set; }
        public int ProjectId { get; set; }
        public bool IsActive { get; set; }
        public DateTime AssignedDate { get; set; }
    }
}
