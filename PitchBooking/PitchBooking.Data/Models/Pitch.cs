using System;
using System.Collections.Generic;

#nullable disable

namespace PitchBooking.Data.Models
{
    public partial class Pitch
    {
        public Pitch()
        {
            Feedbacks = new HashSet<Feedback>();
            SubPitches = new HashSet<SubPitch>();
        }

        public int Id { get; set; }
        public int? PitchOwnerId { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string ImgPath { get; set; }
        public TimeSpan? TimeStart { get; set; }
        public TimeSpan? TimeEnd { get; set; }
        public int? Rates { get; set; }
        public int? Status { get; set; }
        public string Phone { get; set; }

        public virtual UserAccount PitchOwner { get; set; }
        public virtual ICollection<Feedback> Feedbacks { get; set; }
        public virtual ICollection<SubPitch> SubPitches { get; set; }
    }
}
