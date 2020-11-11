<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="orderSuccessful.aspx.cs" Inherits="VivoShop.orderSuccessful" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Porudžbina uspešno izvršena" />
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1>Vaša porudžbina je uspešno izvršena.</h1>
                        <p>Uskoro će Vam Na email adresu koju ste ostavili prilikom poručivanja stići email poruka sa potvrdom porudžbine.</p>
                        <p>Sve porudžbine pristigle do 12h radnim danom šalju se istog dana. Porudžbine pristigle nakon 12h ili vikendom šalju se sledećeg radnog dana.
                            Rok za dostavu je 2 - 5 dana i zavisi od kurirske službe koja je angažovana.</p>
                        <p>Ukoliko želite da izvršite izmenu porudžbine, molimo Vas da nas kontaktirate putem email-a ili telefona.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
