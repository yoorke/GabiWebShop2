<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductGalleryControl.ascx.cs" Inherits="VivoShop.customControls.ProductControls.ProductGallery.ProductGalleryControl" %>
<div class="product__gallery">
    <div class="product-gallery">
        <div class="product-gallery__featured">
            <button class="product-gallery__zoom">
                <svg width="24px" height="24px">
                    <use xlink:href="/images/sprite.svg#zoom-in-24"></use>
                </svg>
            </button>
            <div class="owl-carousel" id="product-image">
                <asp:Repeater ID="rptImages" runat="server" OnItemDataBound="rptImages_ItemDataBound">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkProductImage" runat="server" NavigateUrl='<%#Eval("imageUrl") %>' Target="_blank">
                            <asp:Image ID="imgProductImage" runat="server" ImageUrl='<%#Eval("imageUrl") %>' AlternateText="" />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="product-gallery__carousel">
            <div class="owl-carousel" id="product-carousel">
                <asp:Repeater ID="rptImagesCarousel" runat="server" OnItemDataBound="rptImagesCarousel_ItemDataBound">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkProductImage" runat="server" NavigateUrl='<%#Eval("imageUrl") %>' CssClass="product-gallery__carousel-item">
                            <asp:Image ID="imgProductImage" runat="server" ImageUrl='<%#Eval("imageUrl") %>' CssClass="product-gallery__carousel-image" AlternateText="" />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>