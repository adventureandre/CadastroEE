<%@page import="java.text.DecimalFormat"%>
<%@page import="cadastroee.model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </head>
    <body class="container">
        <%
            //Format Decimal
            DecimalFormat df = new DecimalFormat("#,##0.00");

            // Objeto Produto vindo pelo post
            Produto produto = (Produto) request.getAttribute("produto");

            // Tipo de Acao
            String acao = produto != null ? "alterar" : "incluir";
        %>
        
        <h1><%=acao == "alterar" ? "Alteração" : "Cadastro"%> de Produto</h1>   
        <form class="form" action="ServletProdutoFC" method="post">

            <!--Inclui um campo do tipo hidden, para envio do valor de acao-->
            <input type="hidden" name="acao" value="<%=acao%>">
             
            <%
               //Condicao Para enviar o Id quando for alterar
               if (produto != null) {
            %>
            <input type="hidden" name="id" value="<%=produto.getIdProduto()%>">
            <% }%>


            <div class="mb-3">
                <label class="form-label" for="nome">Nome</label>
                <input class="form-control" type="text" name="nome" value="<%=produto != null ? produto.getNome() : ""%>" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="quantidade">Quantidade</label>
                <input class="form-control" type="text" name="quantidade" value="<%=produto != null ? produto.getQuantidade() : ""%>" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="precoVenda">Preço de Venda</label>
                <input class="form-control" type="text" name="precoVenda" value="<%=produto != null ? produto.getPrecoVenda() : ""%>" required>
            </div>

            <a class="btn e btn-primary " href="ServletProdutoFC" class="">Voltar</a>
            <input class="btn e btn-primary " type="submit" value="<%=acao == "incluir" ? "Incluir" : "Alterar"%>"> 
          
        </form>

    </body>
</html>
