using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;

namespace TP2D71.Models.DAL
{
    public abstract class Repository<T>
    {
        protected string ChaineConnexion => ConfigurationManager.ConnectionStrings["Pokedex"].ConnectionString;
        public abstract void Add(ref T entity);

        public abstract void Remove(int ID);

        public abstract void Update(T entity);

        protected abstract IEnumerable<T> GetEnumerable();

        protected abstract T ConvertReaderToEntity(IDataRecord dr);

        public abstract T Find(int ID);

        public List<T> List() => GetEnumerable().ToList();
    }
}