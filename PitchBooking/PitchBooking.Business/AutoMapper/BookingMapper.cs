using AutoMapper;
using PitchBooking.Business.Enum;
using PitchBooking.Business.Requests.BookingRequest;
using PitchBooking.Business.ViewModel;
using PitchBooking.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.AutoMapper
{
    public class BookingMapper : Profile
    {
        public BookingMapper()
        {
            CreateMap<Booking, BookingModel>()
                .ForMember(d => d.CustomerName, s => s.MapFrom(s => s.Customer.Name))
                .ForMember(d => d.SubPitchName, s => s.MapFrom(s => s.SubPitch.Name))
                .ForMember(d => d.SubPitchImageUrl, s => s.MapFrom(s => s.SubPitch.ImgPath))
                .ForMember(d => d.SubPitchType, s => s.MapFrom(s => s.SubPitch.TypeOfPitch))
                .ForMember(d => d.PitchName, s => s.MapFrom(s => s.SubPitch.Pitch.Name))
                .ForMember(d => d.Address, s => s.MapFrom(s => s.SubPitch.Pitch.Location))
                .ForMember(d => d.Phone, s => s.MapFrom(s => s.SubPitch.Pitch.Phone))
                .ForMember(d => d.DateBooking, s => s.MapFrom(s => FormatDate(s.DateBooking)))
                .ForMember(d => d.TimeStart, s => s.MapFrom(s => FormatTimeSpan(s.TimeStart)))
                .ForMember(d => d.TimeEnd, s => s.MapFrom(s => FormatTimeSpan(s.TimeEnd)))
                .ForMember(d => d.CreateDate, s => s.MapFrom(s => FormatDate(s.CreateDate)))
                .ForMember(d => d.Status, s => s.MapFrom(s => ConvertStatus(s.Status)));

            CreateMap<CreateBookingRequest, Booking>()
                .ForMember(d => d.CreateDate, s => s.MapFrom(s => DateTime.Now))
                .ForMember(d => d.Status, s => s.MapFrom(s => (int)BookingStatus.Booked));
        }

        private static BookingStatus ConvertStatus(int? status)
        {
            if (status == 2) return BookingStatus.Paid;
            else if (status == 1) return BookingStatus.Booked;
            else return BookingStatus.Cancel;
        }

        private static string FormatDate(DateTime? date)
        {
            if (date != null) return date?.ToString("dd/MM/yyyy");
            return null;
        }

        private static string FormatTimeSpan(TimeSpan? time)
        {
            if (time != null) return time?.ToString(@"hh\:mm");
            return null;
        }
    }
}
