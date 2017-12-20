using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace MvcApplication8.Models
{
    public static class ImageHelper
    {
        public static MvcHtmlString Image(this HtmlHelper helper, string src, string altText, string height) {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", src);
            builder.MergeAttribute("alt", altText);
            builder.MergeAttribute("height", height);
            return MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));
        }
    }
}


namespace TP2D71.Helpers
{

    public static class HtmlHelpers
    {
        /// <summary>  
        /// Creates an Html helper for an Image  
        /// </summary>   
        /// <param name="helper"></param>   
        /// <param name="src"></param>   
        /// <param name="altText"></param>   
        /// <returns></returns>   
        public static MvcHtmlString Image(this HtmlHelper helper, string src, string altText) {
            var builder = new TagBuilder("img");
            builder.MergeAttribute("src", src);
            builder.MergeAttribute("alt", altText);
            return MvcHtmlString.Create(builder.ToString(TagRenderMode.SelfClosing));
        }

        public static MvcHtmlString ActionLinkHtml(this AjaxHelper ajaxHelper, string linkText, string actionName,
    string controllerName, object routeValues, AjaxOptions ajaxOptions, object htmlAttributes) {
            var repID = Guid.NewGuid().ToString();
            var lnk = ajaxHelper.ActionLink(repID, actionName, controllerName, routeValues, ajaxOptions, htmlAttributes);
            return MvcHtmlString.Create(lnk.ToString().Replace(repID, linkText));
        }

        //create an action link that can be clicked to sort and has a sorting icon (this is meant to be used to create column headers)   

        public static MvcHtmlString ActionLinkSortable(this HtmlHelper helper, string linkText, string actionName,
    string sortField, string currentSort, object currentDesc) {
            bool desc = (currentDesc == null) ? false : Convert.ToBoolean(currentDesc);
            //get link route values   
            var routeValues = new System.Web.Routing.RouteValueDictionary();
            routeValues.Add("id", sortField);
            routeValues.Add("desc", (currentSort == sortField) && !desc);
            //build the tag   
            if (currentSort == sortField) linkText = string.Format("{0} <span class='badge'><span class='glyphicon glyphicon-sort-by-attributes{1}'></span></span>", linkText, (desc) ? "-alt" : "");
            TagBuilder tagBuilder = new TagBuilder("a");
            tagBuilder.InnerHtml = linkText;
            //add url to the link   
            var urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
            var url = urlHelper.Action(actionName, routeValues);
            tagBuilder.MergeAttribute("href", url);
            //put it all together   
            return MvcHtmlString.Create(tagBuilder.ToString(TagRenderMode.Normal));
        }

        public static string Label(string target, string text) {
            return String.Format("<label for='{0}'>{1}</label>", target, text);
        }

        //Submit Button Helper   
        public static MvcHtmlString SubmitButton(this HtmlHelper helper, string buttonText) {
            string str = "<input type=\"submit\" value=\"" + buttonText + "\" />";
            return new MvcHtmlString(str);
        }

    }
}