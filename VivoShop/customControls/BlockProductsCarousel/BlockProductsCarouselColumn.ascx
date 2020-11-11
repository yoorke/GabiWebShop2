<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockProductsCarouselColumn.ascx.cs" Inherits="VivoShop.customControls.BlockProductsCarousel.BlockProductCarouselColumn" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardControl.ascx" TagName="ProductCard" TagPrefix="Vivo" %>

<div class="block-products-carousel__column">
    <asp:Repeater ID="rptProducts" runat="server">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="block-products-carousel__cell">
                <Vivo:ProductCard ID="productCardControl" runat="server" Product="<%#Container.DataItem %>"></Vivo:ProductCard>
            </div>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
</div>
