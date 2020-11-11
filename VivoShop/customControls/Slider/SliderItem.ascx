<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SliderItem.ascx.cs" Inherits="VivoShop.customControls.Slider.SliderItem" %>

<%--<a class="block-slideshow__slide" href="">--%>
<asp:HyperLink ID="lnkSlider" runat="server" CssClass="block-slideshow__slide">
    <div ID="divDesktop" runat="server"
        class="block-slideshow__slide-image block-slideshow__slide-image--desktop" 
        style="background-image: url('images/slides/slider-840x395.jpg')">
    </div>

    <div ID="divMobile" runat="server"
        class="block-slideshow__slide-image block-slideshow__slide-image--mobile" 
        style="background-image: url('images/slides/slide-1-mobile.jpg')">
    </div>

    <div class="block-slideshow__slide-content">
        <div class="block-slideshow__slide-title">
            <%--Bosch alati<br>GBH 240--%>
            <asp:Literal ID="txtTitle" runat="server"></asp:Literal>
        </div>
        <div 
            class="block-slideshow__slide-text">
                <%--Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>Etiam pharetra laoreet dui quis molestie.--%>
            <asp:Literal ID="txtText" runat="server"></asp:Literal>
        </div>

        <%--<div class="block block-slideshow__slide-text text-white">--%>
            <%--Najnoviji standard u bušenju betona--%>
            <%--<asp:Literal ID="txtTextWhite" runat="server"></asp:Literal>--%>
        <%--</div>--%>

        <div class="block-slideshow__slide-button">
            <span class="btn btn-primary btn-lg">
                <%--Poruči odmah--%>
                <asp:Literal ID="txtButtonText" runat="server"></asp:Literal>
            </span>
        </div>
    </div>
</asp:HyperLink>
<%--</a>--%>