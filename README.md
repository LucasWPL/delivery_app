![DELIVERY APP](https://github.com/user-attachments/assets/06e9ad0f-fc7c-473b-9e7b-777f9951c05c)

## Visão Geral

Bem-vindo ao **App de Delivery**! 📱 Este é um aplicativo desenvolvido em Flutter com o objetivo de ser um PWA inovador para a realização de pedidos através de um cardápio digital super intuitivo. 🍔🍕🥗

Imagine ter em mãos um cardápio completo e dinâmico, onde você pode explorar uma variedade de produtos e fazer seus pedidos de forma prática e rápida. Nossa ideia é consumir uma API robusta que traz todos os produtos disponíveis e permite que você realize seus pedidos com poucos cliques! 🔄✨

## Funcionalidades

- **Tela Inicial (Cardápio):**  
  Uma interface moderna e de fácil navegação para explorar todas as opções do cardápio. Ideal para quem busca praticidade e rapidez na hora de escolher o que pedir. 😋

- **Carrinho de Compras:**  
  Controle total do seu pedido! Adicione, remova e visualize os itens selecionados, garantindo uma experiência sem complicações. 🛒

- **Menu de Perfil & Ajuda:**  
  Em breve, teremos uma área exclusiva para você gerenciar seu perfil e encontrar suporte sempre que precisar. Fique atento! 👤💬

## Arquitetura do Projeto

Trabalhei bastante para criar uma arquitetura limpa, modular e escalável, sempre aplicando as melhores práticas de desenvolvimento. Cada pasta do projeto foi cuidadosamente organizada para facilitar a manutenção e a expansão futura. Confira um resumo da estrutura:

```
lib/
├── bindings/
│   └── general_binding.dart
├── controllers/
│   ├── cart_controller.dart
│   ├── category_controller.dart
│   └── item_controller.dart
├── extensions/
│   ├── custom_text_extension.dart
│   └── currency_extension.dart
├── helpers/
│   ├── firebase_helper.dart
│   ├── screen_helper.dart
│   └── toast_helper.dart
├── models/
│   ...
│   ├── item.dart
│   ├── cart_item.dart
│   └── item.g.dart
├── pages/
│   ├── menu_item_detail_page.dart
│   ├── cart_page.dart
│   └── menu_page.dart
├── repositories/
│   ├── category_repository.dart
│   └── item_repository.dart
├── tokens/
│   ├── brand_colors.dart
│   └── neutral_colors.dart
├── widgets/
│   ├── core/
│   │   └── buttons/
│   │       └── full_size_button.dart
│   ├── firebase/
│   │   ├── firebase_circular_image_widget.dart
│   │   └── firebase_general_image_widget.dart
│   ├── menu/
│   │   ├── menu_category_widget.dart
│   │   └── detail_section_widget.dart
│   └── cart/
│       └── cart_item_widget.dart
├── exports.dart
├── main.dart
└── routes.dart
```


## Conclusão

O **App de Delivery** é mais do que um simples aplicativo – é uma experiência digital completa, pensada para tornar o processo de pedido prático e agradável. Se você é apaixonado por tecnologia e inovação, prepare-se para transformar a maneira como faz seus pedidos! 🚀🍴

Divirta-se explorando o app e aproveite cada detalhe desta experiência incrível! 😄✨
