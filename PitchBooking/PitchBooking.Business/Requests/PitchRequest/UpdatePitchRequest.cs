using Reso.Core.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.Requests.PitchRequest
{
    public class UpdatePitchRequest
    {
        public int? PitchOwnerId { get; set; }
        [String]
        public string Name { get; set; }
        public string Location { get; set; }
        public string ImgPath { get; set; }
        public TimeSpan? TimeStart { get; set; }
        public TimeSpan? TimeEnd { get; set; }
        public int? Rates { get; set; }
    }
}
