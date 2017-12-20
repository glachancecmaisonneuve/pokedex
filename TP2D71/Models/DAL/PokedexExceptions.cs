using System;
using System.Data.Common;
using System.Data.SqlClient;
using System.Runtime.Serialization;

namespace TP2D71.Models.DAL
{
    [Serializable]
    public class PokedexFailedOperationException : DbException
    {
        public PokedexFailedOperationException(string message) : base(message) { }

        public PokedexFailedOperationException(
            string message,
            SqlException e) : base(message, e) { }
    };
}