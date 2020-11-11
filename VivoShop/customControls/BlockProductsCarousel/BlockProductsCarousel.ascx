<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProductsCarousel.ascx.cs" Inherits="VivoShop.customControls.BlockProductsCarousel.BlockProductsCarousel" %>
<%@ Register Src="~/customControls/BlockProductsCarousel/Header.ascx" TagName="Header" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockProductsCarousel/BlockProductsCarouselColumn.ascx" TagName="BlockProductsCarouselColumn" TagPrefix="Vivo" %>

<div id="divBlockProductsCarousel" runat="server" class="block block-products-carousel" data-layout="grid-4">
    <div class="container">

        <Vivo:Header ID="header" runat="server"></Vivo:Header>

        <div class="block-products-carousel__slider">
            <div class="block-products-carousel__preloader"></div>
            <div class="owl-carousel">

                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <Vivo:BlockProductsCarouselColumn runat="server" Products="<%#Container.DataItem %>"></Vivo:BlockProductsCarouselColumn>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
</div>
