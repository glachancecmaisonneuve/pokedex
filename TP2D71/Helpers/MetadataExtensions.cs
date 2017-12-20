using System.Linq.Expressions;
using System.Web.Mvc;
// ReSharper disable once CheckNamespace

namespace System.Web.MVC {

    public static class MetadataExtensions {
        public static IHtmlString GetDisplayName<TModel, TProperty>(
            this HtmlHelper<TModel> html,
            Expression<Func<TModel, TProperty>> ex) {
            ModelMetadata metadata = ModelMetadata.FromLambdaExpression(ex, html.ViewData);
            string displayName = metadata.DisplayName;
            return new HtmlString(html.Encode(displayName));
        }
    }

}