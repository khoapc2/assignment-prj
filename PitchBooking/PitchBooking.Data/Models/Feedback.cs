using System;
using System.Collections.Generic;

#nullable disable

namespace PitchBooking.Data.Models
{
    public partial class Feedback
    {
        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public int? PitchId { get; set; }
        public string Content { get; set; }
        public int? Rating { get; set; }
        public int? BookingId { get; set; }

        public virtual Booking Booking { get; set; }
        public virtual UserAccount Customer { get; set; }
        public virtual Pitch Pitch { get; set; }
    }
}
