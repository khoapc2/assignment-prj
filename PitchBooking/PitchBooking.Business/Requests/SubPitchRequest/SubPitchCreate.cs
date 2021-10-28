using Reso.Core.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.Requests.SubPitchRequest
{
    public class SubPitchCreate
    {
        public int? PitchId { get; set; }

        [String]
        public string? TypeOfPitch { get; set; }
        public int? NormalDayPrice { get; set; }
        public int? SpecialDayPrice { get; set; }
        public int? Status { get; set; }

        [String]
        public string? Name { get; set; }
    }
}
