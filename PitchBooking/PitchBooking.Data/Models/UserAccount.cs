using System;
using System.Collections.Generic;

#nullable disable

namespace PitchBooking.Data.Models
{
    public partial class UserAccount
    {
        public UserAccount()
        {
            Bookings = new HashSet<Booking>();
            Feedbacks = new HashSet<Feedback>();
            Pitches = new HashSet<Pitch>();
        }

        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public int? Status { get; set; }
        public string Role { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<Pitch> Pitches { get; set; }
    }
}
