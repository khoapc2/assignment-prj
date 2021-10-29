using PitchBooking.Business.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.ViewModel
{
    public class BookingModel
    {
        public int? Id { get; set; }
        public int? CustomerId { get; set; }
        public string CustomerName { get; set; }
        public int? SubPitchId { get; set; }
        public string SubPitchName { get; set; }
        public string SubPitchImageUrl { get; set; }
        public string SubPitchType { get; set; }
        public int PitchID { get; set; }
        public string PitchName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string DateBooking { get; set; }
        public string TimeStart { get; set; }
        public string TimeEnd { get; set; }
        public string Price { get; set; }
        public BookingStatus? Status { get; set; }
        public string CancelReason { get; set; }
        public string CreateDate { get; set; }
    }
}
