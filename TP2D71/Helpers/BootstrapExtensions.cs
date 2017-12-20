using System.Collections.Generic;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.MVC;
using System.Web.Mvc.Html;

// ReSharper disable once CheckNamespace

namespace System.Web.Mvc.Html {

    public static class BootstrapExtensions {
        public static IHtmlString GetDisplayName<TModel, TProperty>(
            this HtmlHelper<TModel> html,
            Expression<Func<TModel, TProperty>> ex) {
            ModelMetadata metadata = ModelMetadata.FromLambdaExpression(ex, html.ViewData);
            string displayName = metadata.DisplayName;
            return new HtmlString(html.Encode(displayName));
        }
        /*
        public static MvcHtmlString InputGroupFor<TModel>(
            this HtmlHelper<TModel> html,
            Expression<Func<TModel, TResult>> expression) {
                return InputGroupFor(html, expression, (object)"");
        }

        public static MvcHtmlString InputGroupFor<TModel, TResult>(
            this HtmlHelper<TModel> html,
            Expression<Func<TModel, TResult>> expression,
            string htmlAttributes) {
            return InputGroupFor(html, expression, (object) htmlAttributes);
        }*/
        //public static MvcHtmlString InputGroupFor<TModel, TResult>(this HtmlHelper<TModel> html, Expression<Func<TModel, TResult>> expression, IDictionary<string, object> htmlAttributes) {
        public static MvcHtmlString InputGroupFor<TModel, TProperty>(this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression) {
            return html.InputGroupFor(expression, (object)null);
        }

        //public static MvcHtmlString InputGroupFor<TModel, TResult>(this HtmlHelper<TModel> html, Expression<Func<TModel, TResult>> expression, IDictionary<string, object> htmlAttributes) {
        public static MvcHtmlString InputGroupFor<TModel, TProperty>(this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression,
            object htmlAttributes) {
            var tb = new TagBuilder("div");
            var attributes = HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes) as IDictionary<string, object>;
            tb.MergeAttributes(attributes); 
            tb.Class("input-group");
            
            tb.AppendHtml(html.LabelFor(expression, htmlAttributes: new { @class = "control-label input-group-addon" }));
            tb.AppendHtml(html.TextBoxFor(expression, htmlAttributes: new { @class = "form-control", Placeholder = html.DisplayNameFor(expression) }));
            return MvcHtmlString.Create(tb.ToString());
        }
    }
}