<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="kontakt.aspx.cs" Inherits="VivoShop.kontakt" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Kontakt" />

        <div class="block">
            <div class="container">
                <div class="card mb-0 contact-us">
                    <div class="card-body">
                        <div class="contact-us__container">
                            <div class="row">
                                <div class="col-12 col-lg-6 pb-4 pb-lg-0">
                                    <h4 class="contact-us__header card-title">Naša adresa</h4>
                                    <div class="contact-us__address">
                                        <p>
                                            Hunjadi Janoša 33, 23000 Zrenjanin<br />
                                            Email: prodaja@gabi-boje.rs<br />
                                            Telefon: 023 581 810
                                        </p>
                                        <p>
                                            <strong>Radno vreme</strong><br />
                                            Ponedeljak - petak: 7h - 19h<br />
                                            Subota: 7h - 14h<br />
                                            Nedelja: neradna
                                        </p>
                                        <p>
                                            <strong>Gabi boje - boje i lakovi</strong><br />
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit suscipit mi, non
                                            tempor nulla finibus eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                        </p>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <h4 class="contact-us__header card-title">Postavite nam pitanje</h4>
                                    <div role="form">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for='<%=txtName.ClientID %>'>Vaše ime</label>
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Vaše ime"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for='<%=txtEmail.ClientID %>'>Email</label>
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtSubject.ClientID %>'>Naslov</label>
                                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Naslov"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for='<%=txtMessage.ClientID %>'>Poruka</label>
                                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="Poruka" TextMode="MultiLine" Height="50px"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary" Text="Pošalji" OnClick="btnSend_Click" />
                                        <div id="divStatus" runat="server" visible="false" class="mt-4 alert">
                                            <asp:Literal ID="lblStatus" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
