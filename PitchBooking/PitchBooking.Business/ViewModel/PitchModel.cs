using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class PitchModel
    {
        public int Id { get; set; }
        public int? PitchOwnerId { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string ImgPath { get; set; }
        public string Time { get; set; }
        public int? Rates { get; set; }
        public int? Status { get; set; }
    }
}
