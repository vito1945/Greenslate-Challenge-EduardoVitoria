using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GreenslateChallenge.Models
{
    public class ChartInformationViewModel
    {
        public List<int> ProjectsIds { get; set; }
        public List<DateTime> StartDates { get; set; }
        public List<string> TimeToStart { get; set; }
        public List<DateTime> EndDates { get; set; }
        public List<int> Credits { get; set; }
        public List<string> isActive { get; set; }
    }

}
