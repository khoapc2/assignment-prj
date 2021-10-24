using System;
using System.Collections.Generic;

#nullable disable

namespace PitchBooking.Data.Models
{
    public partial class SubPitch
    {
        public SubPitch()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public int PitchId { get; set; }
        public string ImgPath { get; set; }
        public string TypeOfPitch { get; set; }
        public int NormalDayPrice { get; set; }
        public int SpecialDayPrice { get; set; }
        public int? Status { get; set; }
        public string Name { get; set; }

        public virtual Pitch Pitch { get; set; }
        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
