using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class SubPitchModel
    {
        public int Id { get; set; }
        public int PitchId { get; set; }
        public string TypeOfPitch { get; set; }
        public int NormalDayPrice { get; set; }
        public int SpecialDayPrice { get; set; }
        public int? Status { get; set; }
        public string Name { get; set; }
    }
}
