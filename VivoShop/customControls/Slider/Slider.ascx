<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slider.ascx.cs" Inherits="VivoShop.customControls.Slider.Slider" %>
<%@ Register Src="~/customControls/Slider/SliderItem.ascx" TagName="SliderItem" TagPrefix="Vivo" %>

<!-- .block-slideshow -->
<div class="block-slideshow block-slideshow--layout--with-departments block">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 d-none d-lg-block"></div>
            <div class="col-12 col-lg-9">
                <div class="block-slideshow__body">
                    <div class="owl-carousel">

                        <asp:Repeater ID="rptSlider" runat="server">
                            <ItemTemplate>
                                <Vivo:SliderItem runat="server" Item="<%#Container.DataItem %>"></Vivo:SliderItem>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
