﻿using PitchBooking.Business.Requests.BookingRequest;
using PitchBooking.Business.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PitchBooking.Business.IServices
{
    public interface IBookingService
    {
        public Task<IEnumerable<BookingModel>> GetListBookedByCustomerID(int id);
        public Task<bool> CancelBooking(CancelBookingRequest request);
        public Task<IEnumerable<BookingModel>> GetListBookingHistoryByCustomerID(int id);
        public Task<BookingModel> CreateBooking(CreateBookingRequest request);
        public Task<BookingModel> GetBookingByID(int id);
        public Task<IEnumerable<BookingModel>> GetListBookingBySubPitchID(int id);
        public Task<bool> PaidBooking(int id);
        public ValidateTimeBookingResponse ValidateTimeBooking(ValidateTimeBookingRequest request);
    }
}
