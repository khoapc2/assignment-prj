using System;
using System.Collections.Generic;

#nullable disable

namespace PitchBooking.Data.Models
{
    public partial class Booking
    {
        public Booking()
        {
            Feedbacks = new HashSet<Feedback>();
        }

        public int Id { get; set; }
        public int? CustomerId { get; set; }
        public int? SubPitchId { get; set; }
        public DateTime DateBooking { get; set; }
        public TimeSpan? TimeStart { get; set; }
        public TimeSpan? TimeEnd { get; set; }
        public string Price { get; set; }
        public int? Status { get; set; }
        public string CancelReason { get; set; }

        public virtual UserAccount Customer { get; set; }
        public virtual SubPitch SubPitch { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
    }
}
