# DeboraPatareloAtelie
Projeto acadêmico desenvolvido para a disciplina Modelagem de Banco de Dados.

Aluno: Gabriel Prates Gonçalves

1º semestre Desenvolvimento de Software Multiplataforma - FATEC-Franca/SP

## Cenário do Banco de Dados

O Débora Patarelo Ateliê atua há mais de 10 anos no ramo de bordados e confecção artesanal de bolsas, kits maternidade, necessaires e produtos personalizados. Com o crescimento do negócio e o aumento do número de clientes e pedidos, surgiu a necessidade de desenvolver um sistema informatizado para organizar e controlar os processos da empresa.
O sistema deverá armazenar os dados dos clientes, que serão identificados por um código único de cadastro. Cada cliente possuirá nome completo, CPF, e-mail, data de nascimento e endereço. O endereço será composto por rua, número, bairro, cidade, estado e CEP. Além disso, um cliente poderá possuir mais de um telefone para contato, permitindo o cadastro de números pessoais, comerciais ou WhatsApp.
Os produtos comercializados pelo ateliê serão organizados em categorias, como bolsas, kits, necessaires e bordados. Cada produto será identificado por um código único e possuirá nome, descrição, cor, tamanho, preço e status de disponibilidade, indicando se o produto está disponível, esgotado ou sob encomenda. Cada categoria poderá conter diversos produtos, enquanto cada produto pertencerá a apenas uma categoria.
Os clientes poderão realizar diversos pedidos ao longo do tempo. Cada pedido será identificado por um código único e registrará a data da compra, a situação do pedido e o valor total da compra. Um cliente poderá realizar vários pedidos, porém cada pedido estará vinculado a apenas um cliente.
Cada pedido poderá conter vários produtos, e um mesmo produto poderá estar presente em diversos pedidos diferentes. Para controlar essa relação, o sistema armazenará a quantidade de cada produto adquirida em cada pedido, bem como o valor unitário praticado no momento da venda.
Como o principal diferencial do ateliê é a personalização dos produtos, o sistema também deverá registrar informações sobre bordados personalizados solicitados pelos clientes. Cada personalização possuirá um código identificador, contendo informações como nome a ser bordado, frase personalizada, cor da linha, observações e valor adicional do serviço. Um pedido poderá possuir diversas personalizações, enquanto cada personalização estará vinculada a apenas um pedido.
Para controle financeiro, o sistema registrará os pagamentos realizados pelos clientes. Cada pagamento possuirá um código identificador, forma de pagamento, data do pagamento, valor pago e situação do pagamento. Cada pedido estará associado a um pagamento, permitindo controlar pedidos pagos, pendentes ou cancelados.
Além das informações armazenadas diretamente no banco de dados, o sistema deverá permitir calcular automaticamente a idade dos clientes a partir de sua data de nascimento e o valor total de cada pedido com base nos produtos e personalizações vinculados a ele.
O objetivo do sistema é modernizar a gestão do Débora Patarelo Ateliê, proporcionando maior organização dos dados, melhor controle dos pedidos e suporte ao crescimento futuro da empresa.

 ## Modelagem Conceitual
 Diagrama Entidade-Relacionamento , identificando entidades,atributos e relacionamentos assim como a cardinalidade entre elas.

<img width="5008" height="3364" alt="image" src="https://github.com/user-attachments/assets/bfdf68d0-36aa-4512-ad65-effa7b26e3bb" />

## Modelo Lógico
Após a conclusão da Modelo DER, foram convertidas tabelas identificando as chaves primárias (PKs)  e as chaves estrangeiras (FKs)

<img width="5832" height="3784" alt="image" src="https://github.com/user-attachments/assets/9a61c0c9-feb4-42bf-acc4-fc47577d39a3" />






