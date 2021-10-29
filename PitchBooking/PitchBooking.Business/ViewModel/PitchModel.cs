using Reso.Core.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class PitchModel
    {
        public int? Id { get; set; }
        public int? PitchOwnerId { get; set; }
        [String]
        public string Name { get; set; }
        public string Location { get; set; }
        public string ImgPath { get; set; }
        public string Phone { get; set; }
        public TimeSpan? TimeStart { get; set; }
        public TimeSpan? TimeEnd { get; set; }
        public double? Rates { get; set; }
        public int? Status { get; set; }
    }
}
