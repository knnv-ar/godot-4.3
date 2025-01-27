# Godot Engine v4.3

## Índice
- [Capítulo 1. Introducción](#capítulo-1-introducción)
- [Capítulo 2. Primeros pasos](#capítulo-2-primeros-pasos)
- [Capítulo 3. Tu primer juego 2D](#capítulo-3-tu-primer-juego-2d)
- [Capítulo 4. Tu primer juego 3D](#capítulo-4-tu-primer-juego-3d)
---

```
Scene > Create Root Node: 2D Scene
FileSystem > btn_der > New Script > new_script.gd
doble_clic > new_script.gd

print("hola mundo")
```

## Algunas caracteristicas de Godot 4

- GDScript 2.0 (C++[GDCPP] o C# [.NET 6.0])
- GDExtension reemplaza a GDNative
- GodotPhysics 2.0 > Character Body [2D y 3D]
- Nuevo editor de Tiles 2D
- Nuevo sistema multiplayer (nueva API)
- Internacionalización

Mobile Highend con Vulkan (iPhone y Galaxy) vs Mobile Lowend con OpenGL (el resto)

Importante: Lograr tanto una estética como una mecánica innovativa (Juan Linietsky).

**Componentes principales de Godot:**

- Nodos
- Escenas
- Árbol de escenas
- Señales
- Instancias
- Recursos


## Capítulo 1. Introducción	

Godot puede crear tanto juegos como aplicaciones de tipo desktop, mobile o web. También juegos de consola pero se debe tener altas habilidades de programación y adecuación a estandares de producción internacionales.

Algunos juegos realizados en la plataforma:

- Ex-Zodiac
- Helms of Fury
- Pixelorama

Tiene un editor de juego que incluye:

- un editor de código,
- un editor de animación,
- un editor de tilemap,
- un editor de shader,
- un debugger,
- un profiler, y mucho más.

### Aprende a programar con GDScript: GDScript en 27 lecciones

[Learn GDScript From Zero app](https://gdquest.github.io/learn-gdscript/?ref=godot-docs)

Lesson 1: What code is like
Lesson 2: Your first error
Lesson 3: We stand on the Shoulders of Giants
Lesson 4: Drawing a Rectangle
Lesson 5: Coding your first function
Lesson 6: Your First Function Parameter
Lesson 7: Introduction to Member Variables
Lesson 8: Defining your own variables
Lesson 9: Adding and subtracting
Lesson 10: The Game Loop
Lesson 11: Time Delta
Lesson 12: Using Variables to Make Code Easier to Read
Lesson 13: Conditions
Lesson 14: Multiplying
Lesson 15: 2D Vectors
Lesson 16: Introduction to While Loops
Lesson 17: Introduction to For Loops
Lesson 18: Creating Arrays
Lesson 19: Looping Over Arrays
Lesson 20: Strings
Lesson 21: Functions that return a value
Lesson 22: Appending and Popping values from arrays
Lesson 23: Accessing values in arrays
Lesson 24: Creating Dictionaries
Lesson 25: Looping over dictionaries
Lesson 26: Value types
Lesson 27: Specifying types with type hints

### Descripción de los conceptos clave de Godot

En Godot, un juego es un **árbol de escenas** y cada escena es un **árbol de nodos**. Los nodos pueden comunicarse entre sí mediante **señales**.

#### Escenas

La idea es que las escenas son elementos flexibles que suelen ser reutilizados. Una escena puede ser un personaje, un arma, un menú en la interfaz de usuario, una sola casa, un nivel entero o cualquier cosa que puedas imaginar.

#### Nodos

Un nodo es un componente de una escena, el bloque de construcción más pequeño. A continuación podemos ver los nodos que componen el personaje _Player_: 

![godot-nodes](img/key_concepts_character_nodes.webp)

Está compuesto de un nodo `CharacterBody2D` llamado _Player_, un nodo `Camera2D`, un nodo `Sprite2D`, y un nodo `CollisionShape2D`.

> **Nota:**
>
> Los nombres de los nodos terminan con "2D" porque se trata de una escena 2D. Sus contrapartes 3D tienen nombres que terminan con "3D". Tenga en cuenta que los nodos `Spatial` ahora se denominan `Nodo3D` a partir de Godot 4.

Godot ofrece una amplia biblioteca de `tipos de nodos` base que puedes combinar y ampliar para crear otros más potentes. 2D, 3D o interfaz de usuario, harás la mayoría de las cosas con estos nodos.

#### El árbol de escena

Todas las escenas de tu juego se reúnen en el **árbol de escena**, que es literalmente un árbol de escenas. Y como las escenas son árboles de nodos, el árbol de escenas también es un árbol de nodos. Pero es más fácil pensar en tu juego en términos de escenas, ya que pueden representar personajes, armas, puertas o tu interfaz de usuario.

All your game's scenes come together in the scene tree, literally a tree of scenes. And as scenes are trees of nodes, the scene tree also is a tree of nodes. But it's easier to think of your game in terms of scenes as they can represent characters, weapons, doors, or your user interface.

#### Señales

Los nodos emiten **señales** cuando se produce algún evento. Esta función le permite hacer que los nodos se comuniquen sin necesidad de cablearlos en el código. Le brinda mucha flexibilidad en la forma en que estructura sus escenas.

![godot-signals](img/key_concepts_signals.webp)

> **Nota:**
>
> Las señales son la versión de Godot del _patrón del observador_. Puedes leer más sobre esto aquí: https://gameprogrammingpatterns.com/observer.html.

Por ejemplo, los botones emiten una señal cuando se presionan. Puedes conectarte a esta señal para ejecutar código en reacción a este evento, como iniciar el juego o abrir un menú.

Otras señales integradas pueden indicarte cuándo chocaron dos objetos, cuándo un personaje o monstruo ingresó a un área determinada y mucho más. También puedes definir nuevas señales adaptadas a tu juego.

#### Resumen

Los nodos, las escenas, el árbol de escena y las señales son cuatro conceptos básicos de Godot que manipularás todo el tiempo.

Los `nodos` son los bloques de construcción más pequeños de tu juego. Los combinas para crear `escenas` que luego combinas y anidan en el `árbol de escena`. Luego puedes usar `señales` para hacer que los nodos reaccionen a eventos en otros nodos o en diferentes ramas del árbol de escena.

### Primer vistazo a la interfaz de Godot

#### El `Project Manager`

Cuando Godot inicia, la primera ventana que ve es el `Project Manager` (Administrador de Proyectos). En la pestaña predeterminada `Projects`, puede administrar proyectos existentes, importar o crear nuevos, y más.

![godot-project-manager](img/editor_intro_project_manager.webp)

En la parte superior de la ventana, hay otra pestaña llamada `Asset Library` (Biblioteca de activos). La primera vez que acceda a esta pestaña, verá un botón "Conectarse". Por razones de privacidad, el administrador de proyectos de Godot no accede a Internet de manera predeterminada. Para cambiar esto, haga clic en el botón "Conectarse". Puede cambiar esta opción más adelante en la configuración.

Una vez que el modo de red esté configurado en "en línea", puede buscar proyectos de demostración en la biblioteca de recursos de código abierto, que incluye muchos proyectos desarrollados por la comunidad:

![godot-project-templates](img/editor_intro_project_templates.webp)

La configuración del `Project Manager` se puede abrir mediante el menú `Settings`:

![godot-settings](img/editor_intro_settings.webp)

Desde aquí, puede cambiar el idioma del editor (el idioma predeterminado es el idioma del sistema), el tema de la interfaz, la escala de visualización, el modo de red y también la convención de nombres de directorios.

> **Consulte también:**
>
> Para conocer los entresijos del `Project Manager`, lea [Using the Project Manager](https://docs.godotengine.org/en/stable/tutorials/editor/project_manager.html#doc-project-manager).

#### Primer vistazo al editor de Godot


Cuando abres un proyecto nuevo o uno existente, aparece la interfaz del editor. Veamos sus áreas principales:

![godot-editor](img/editor_intro_editor_empty.webp)

De manera predeterminada, a lo largo del borde superior de la ventana, se encuentra el `menú principal`. En el menú principal a la izquierda, los botones de cambio de `workspace` (espacio de trabajo) en el centro (el espacio de trabajo activo está resaltado) y los botones de `playtest` (prueba de juego) a la derecha:

![godot-top-menus](img/editor_intro_top_menus.webp)

Justo debajo de los botones del `workspace`, se ven las escenas abiertas como pestañas. El botón más (+) junto a las pestañas agregará una nueva escena al proyecto. Con el botón del extremo derecho se puede activar el modo sin distracciones, que maximiza o restaura el tamaño de la ventana gráfica ocultando los elementos acoplados en la interfaz:

![godot-scene-selector](img/editor_intro_scene_selector.webp)

En el centro, debajo del selector de escenas, se encuentra la `viewport` (ventana gráfica) con su `toolbar` (barra de herramientas) en la parte superior, donde encontrará diferentes herramientas para mover, escalar o bloquear los nodos de la escena (actualmente, el espacio de trabajo 3D está activo):

![godot-3D-viewport](img/editor_intro_3d_viewport.webp)

Esta `toolbar` cambia según el contexto y el nodo seleccionado. Aquí está la barra de herramientas 2D:

![godot-2D-toolbar](img/editor_intro_toolbar_2d.webp)

A continuación se muestra la barra de herramientas 3D:

![godot-3D-toolbar](img/editor_intro_toolbar_3d.webp)

A ambos lados de la `viewport` se encuentran los `docks` (muelles). Y en la parte inferior de la ventana se encuentra el `bottom panel` (panel inferior).

Veamos los docks. El dock `FileSystem` (sistema de archivos) muestra una lista de los archivos de su proyecto, incluidos scripts, imágenes, muestras de audio y más:

![godot-filesystem-dock](img/editor_intro_filesystem_dock.webp)

El dock `Scene` (Escena) muestra una lista de los nodos de la escena activa:

![godot-scene-dock](img/editor_intro_scene_dock.webp)

El dock `Inspector` le permite editar las propiedades de un nodo seleccionado:

![godot-inspector-dock](img/editor_intro_inspector_dock.webp)

El `bottom panel` (panel inferior), ubicado debajo de la _viewport_, es el host de la consola de depuración, el editor de animación, el mezclador de audio y más. Pueden ocupar un espacio muy valioso, por eso están plegados de forma predeterminada:

![godot-bottom-panel](img/editor_intro_bottom_panels.webp)

Al hacer clic en uno, se expande verticalmente. A continuación, puedes ver el editor de animaciones abierto:

![godot-bottom-panel-animation](img/editor_intro_bottom_panel_animation.webp)

Los paneles inferiores también se pueden mostrar u ocultar mediante los accesos directos definidos en `Editor Settings > Shortcuts`, en la categoría `Bottom Panels`.

#### Las cuatro pantallas principales

Hay cuatro botones de la pantalla principal centrados en la parte superior del editor: `2D`, `3D`, `Script` y `Asset Library` (biblioteca de recursos).

Usarás la `2D screen` para todo tipo de juegos. Además de los juegos 2D, la pantalla 2D es donde crearás tus interfaces.

![godot-2D](img/editor_intro_workspace_2d.webp)

En la `3D screen`, puedes trabajar con meshes (mallas), luces y niveles de diseño para juegos 3D.

![godot-3D](img/editor_intro_workspace_3d.webp)

La `Script screen` es un editor de código completo con un depurador, autocompletado enriquecido y referencia de código incorporada.

![godot-script](img/editor_intro_workspace_script.webp)

Por último, la `Asset Library screen` es una biblioteca de complementos, scripts y activos gratuitos y de código abierto para usar en sus proyectos.

![godot-asset-library](img/editor_intro_workspace_assetlib.webp)

#### Referencia de clase integrada (Integrated class reference)

Godot viene con una referencia de clase incorporada.

Puede buscar información sobre una clase, método, propiedad, constante o señal mediante cualquiera de los siguientes métodos:

- Presionando `F1` (u `Opt + Space` en macOS, o `Fn + F1` para computadoras portátiles con una tecla `Fn`) en cualquier parte del editor.
- Haciendo clic en el botón `Search Help` en la esquina superior derecha de la pantalla principal de Script.
- Haciendo clic en el menú Ayuda y Buscar ayuda.
- `Ctrl + clic` (`Cmd + clic` en macOS) en un nombre de clase, nombre de función o variable integrada en el editor de scripts.

![godot-search-help-button](img/editor_intro_search_help_button.webp)

Cuando haces cualquiera de estas cosas, aparece una ventana. Escribe para buscar cualquier elemento. También puedes usarla para explorar los objetos y métodos disponibles.

![godot-search-help](img/editor_intro_search_help.webp)

Haz doble clic en un elemento para abrir la página correspondiente en la pantalla principal del script.

![godot-help-class](img/editor_intro_help_class_animated_sprite.webp)

Alternativamente,

- Haz clic mientras presionas la tecla `Ctrl` en un nombre de clase, nombre de función o variable integrada en el editor de scripts.
- Haz clic derecho en los nodos y elige `Open Documentation` o elige `Lookup Symbol` para elementos en el editor de scripts para abrir directamente su documentación.

### Aprendiendo nuevas funciones

Recomendamos:

- El curso CS50 de la universidad Harvard,
- El libro "Automate The Boring Stuff With Python" de _Al Sweigart_,
- y los [Community tutorials and resources](https://docs.godotengine.org/en/stable/community/tutorials.html#doc-community-tutorials)

### La filosofía del diseño de Godot

Cada motor de juegos ofrece una variedad de funciones que determinan flujos de trabajo (workflows) y estructuras de juegos con características específicas. 

#### Diseño y composición orientada a objetos

Esencialmente Godot adopta el **diseño orientado a objetos** que incorpora un **sistema de escenas flexible** y una **jerarquía de nodos**. Intenta mantenerse alejado de los patrones de programación estrictos para ofrecer una forma intuitiva de estructurar el juego.

En primer lugar, Godot te permite **componer o agregar escenas**. Es como prefabs (prefabricados) anidados. Además de eso, puedes **heredar** de cualquier escena.

##### Escenas

Una **escena** de Godot puede ser un arma, un personaje, un objeto, una puerta, un nivel, parte de un nivel... lo que quieras. Funciona como una **clase** en código puro, excepto que eres libre de diseñarla usando el editor, usando solo el código o mezclando y combinando los dos.

Es diferente de los prefabs que encuentras en varios motores 3D, ya que luego puedes **heredar** y **extender** esas escenas. Puedes crear un `Wizard` que extienda tu `Character`. Modifica el `Character` en el editor y el `Wizard` también se actualizará:

![godot-engine-design](img/engine_design_01.webp)

Te ayuda a construir tus proyectos para que su estructura coincida con el diseño del juego.

##### Nodos

Godot también ofrece muchos tipos diferentes de objetos llamados **nodos**, cada uno con un propósito específico. Los nodos son parte de un **árbol** y siempre heredan de sus padres hasta la clase `Node`. Aunque el motor sí presenta algunos nodos como _formas de colisión_ que utilizará un _cuerpo de física_ padre, la mayoría de los nodos funcionan de forma independiente entre sí.

![godot-engine-design2](img/engine_design_02.webp)

`Sprite2D` es un `Node2D`, un `CanvasItem` y un `Node` (ver las relaciones en la imagen precedente). Tiene todas las _propiedades_ y _características_ de sus tres clases padre, como transformaciones o la capacidad de dibujar formas personalizadas y renderizar con un sombreador personalizado.

#### Paquete todo-incluido

Godot intenta ofrecer sus propias herramientas para responder a las necesidades más comunes.

Tiene: 
- un **espacio de trabajo dedicado a la creación de scripts** (`scripting workspace`),
- un **editor de animación** (`animation editor`),
- un editor de mapas de mosaicos (`tilemap editor`),
- un editor de sombreadores (`shader editor`),
- un depurador (`debugger`),
- un generador de perfiles (`profiler`),
- la capacidad de recarga en caliente (`hot-reload`) de forma local y en dispositivos remotos, etc.

!![godot-engine-design3](img/engine_design_03.webp)

Godot ofrece su propio **lenguaje de programación** `GDScript` junto con _C#_. GDScript está diseñado para las necesidades de los desarrolladores y diseñadores de juegos, y está estrechamente integrado en el motor y el editor.

GDScript te permite escribir código utilizando una sintaxis basada en indentación, pero detecta tipos y ofrece la calidad de autocompletado de un lenguaje estático. También está optimizado para código de juego con tipos integrados como **Vectores** y **Colores**.

Ten en cuenta que con `GDExtension`, puedes escribir código de alto rendimiento utilizando lenguajes compilados como _C_, _C++_, _Rust_, _D_, _Haxe_ o _Swift_ sin tener que volver a compilar el motor.

Ten en cuenta que el espacio de trabajo 3D no cuenta con tantas herramientas como el espacio de trabajo 2D. Necesitarás programas externos o complementos para editar terrenos, animar personajes complejos, etc. Godot proporciona una API completa para ampliar la funcionalidad del editor utilizando código de juego.

A continuación se puede ver una imagen correspondiente al plugin `State Machine editor` el cual permite administrar estados y transiciones de forma visual:

![godot-state-machine-editor](img/engine_design_fsm_plugin.webp)

#### El editor Godot es un juego Godot

El editor Godot se ejecuta en el motor del juego. Utiliza el sistema de interfaz de usuario propio del motor, puede recargar en caliente el código y las escenas cuando pruebas tus proyectos o ejecutar el código del juego en el editor. Esto significa que puedes usar el mismo código y las mismas escenas para tus juegos o crear complementos y ampliar el editor.

Esto genera un sistema de interfaz de usuario confiable y flexible, ya que impulsa el editor en sí. Con la anotación `@tool`, puedes ejecutar cualquier código de juego en el editor.

Coloque la anotación `@tool` en la parte superior de cualquier archivo GDScript y se ejecutará en el editor. Esto le permite importar y exportar complementos, crear complementos como editores de niveles personalizados o crear scripts con los mismos nodos y API que usa en sus proyectos.

Por poner un sólo ejemplo, `RPG in a Box` es un editor de RPG de vóxeles creado con Godot 2. Utiliza las herramientas de interfaz de usuario de Godot para su sistema de programación basado en nodos y para el resto de la interfaz:

![godot-state-machine-editor](img/engine_design_rpg_in_a_box.webp)

#### Motores 2D y 3D independientes

Godot ofrece motores de renderizado 2D y 3D dedicados. Como resultado, **la unidad base para las escenas 2D son los píxeles**. Aunque los motores están separados, puedes renderizar 2D en 3D, 3D en 2D y superponer sprites e interfaces 2D sobre tu mundo 3D.

## Capítulo 2. Primeros pasos

Este capítulo, que requiere la lectura del [Capítulo 1. Introducción](#capítulo-1-introducción), te ayudará a empezar a trabajar con el **editor** y el **motor**. Aprenderás más sobre **nodos** y **escenas**, codificarás tus primeras clases con **GDScript**, usarás **señales** para hacer que los nodos se comuniquen entre sí, y más.

Las siguientes lecciones están aquí para prepararte para [Capítulo 3. Tu primer juego 2D](#capítulo-3-tu-primer-juego-2D), un tutorial paso a paso en el que codificarás un juego desde cero. Al final, tendrás las bases necesarias para explorar más funciones en otras secciones. También incluimos enlaces a páginas que cubren un tema determinado en profundidad cuando corresponde.

- [Nodos y escenas](#nodos-y-escenas)
- [Creación de instancias](#creación-de-instancias)
- [Lenguajes de programación](#lenguajes-de-programación)
- [Creación de tu primer script](#creación-de-tu-primer-script)
- [Escuchar la entrada del jugador](#escuchar-la-entrada-del-jugador)
- [Uso de señales](#uso-de-señales)

### Nodos y escenas

#### Nodos

**Los nodos son los bloques de construcción fundamentales de tu juego**. Son como los ingredientes de una receta. Hay docenas de tipos que pueden hacer distintas cosas: mostrar una imagen, reproducir un sonido, representar una cámara y mucho más.

![godot-nodos-escenas](img/nodes_and_scenes_nodes.webp)

Todos los nodos tienen las siguientes características:

- Un **nombre** (name).
- **Propiedades** editables (properties).
- Reciben **devoluciones de llamadas** (callbacks) para actualizar cada cuadro.
- Puedes **extenderlos** (extends) con nuevas propiedades y funciones.
- Puedes **agregarlos** (add child node) a otro nodo como hijo.

La última característica es importante. Juntos, los nodos forman un **árbol**, que es una característica poderosa para organizar proyectos. Dado que los diferentes nodos tienen diferentes funciones, combinarlos produce un comportamiento más complejo. Como vimos antes, puedes construir un **personaje jugable que sea seguido por una cámara** usando un nodo `CharacterBody2D`, un nodo `Sprite2D`, un un nodo `CollisionShape2D` y un nodo `Camera2D`:

![godot-character](img/nodes_and_scenes_character_nodes.webp)

#### Escenas

Cuando organizás **nodos** en un **árbol**, como nuestro personaje, llamamos a esta construcción una **escena**. Una vez guardadas, las escenas funcionan como nuevos tipos de nodos en el editor, donde puedes agregarlas como un elemento secundario de un nodo existente. En ese caso, la instancia de la escena aparece como un solo nodo con sus componentes internos ocultos.

Las escenas te permiten estructurar el código de tu juego como quieras. Puedes **componer nodos** para crear tipos de nodos personalizados y complejos, como un personaje de juego que corre y salta, una barra de vida, un cofre con el que puedes interactuar y más:

![godot-3d-scene-example](img/nodes_and_scenes_3d_scene_example.webp)

El **editor Godot** es esencialmente un **editor de escenas**. Tiene muchas herramientas para editar escenas 2D y 3D, así como interfaces de usuario. Un proyecto Godot puede contener tantas de estas escenas como necesites. El motor solo requiere una como **escena principal** de tu aplicación. Esta es la escena que Godot cargará primero cuando tú o un jugador ejecuten el juego.

Además de actuar como nodos, las escenas tienen las siguientes características:

- Siempre tienen un nodo raíz, como el `Player` en nuestro ejemplo.
- Puedes guardarlas en tu disco local y cargarlas más tarde.
- Puedes crear tantas instancias de una escena como desees. Puedes tener cinco o diez personajes en tu juego, creados a partir de tu escena de `Character`.

#### Creando tu primera escena

Creemos nuestra primera escena con un solo nodo. Para ello, primero tendrás que crear un nuevo proyecto.

**Para crear un nuevo proyecto**

1. Haga clic en el botón `+ Create` en la parte superior izquierda de la ventana.

![godot-project-manager](img/godot-project-manager.png)

2. Dé un nombre al proyecto, luego abra el explorador de archivos con el botón `Browse` y elija una carpeta vacía en su computadora para guardar los archivos. Alternativamente, puede habilitar la opción `Create Folder` para crear automáticamente una nueva subcarpeta con el nombre del proyecto, siguiendo la convención de nombres de directorio establecida en la configuración. Una carpeta vacía mostrará una marca de verificación verde a la derecha.
3. Seleccione uno de los backends de renderizado (esto también se puede cambiar más tarde).
4. Haga clic en el botón `Create & Edit` para crear la carpeta del proyecto y abrirla en el editor.

![godot-project-manager-02](img/editor_ui_intro_project_manager_04.webp)

Después de abrir el proyecto, deberías ver un editor vacío:

![godot-empy-editor](img/nodes_and_scenes_01_empty_editor.webp)

En una escena vacía, el dock `Scene` en la parte de la izquierda muestra varias opciones para agregar un nodo raíz rápidamente. `2D Scene` (Escena 2D) agrega un nodo _Node2D_ (Nodo 2D), `3D Scene` (Escena 3D) agrega un nodo _Node3D_ (Nodo 3D) y `User Interface` (Interfaz de usuario) agrega un nodo _Control_. Estos ajustes preestablecidos están aquí para mayor comodidad; no son obligatorios. `Other Node` (Otro nodo) te permite seleccionar cualquier nodo para que sea el nodo raíz. En una escena vacía, `Other Node` (Otro nodo) es equivalente a presionar el botón `Add Child Node` (Agregar nodo hijo o secundario) en la parte superior izquierda del dock `Scene` (Escena), que generalmente agrega un nuevo nodo como secundario del nodo seleccionado actualmente.

Agregaremos un solo nodo `Label` (Etiqueta) a nuestra escena. Su función es presentar texto en la pantalla. Presione el botón `Add Child Node` (Agregar nodo secundario) u `Other Node` (Otro nodo) para crear un nodo raíz:

![godot-add-child-node](img/nodes_and_scenes_02_scene_dock.webp)

Se abre el cuadro de diálogo `Create New Node`, que muestra la larga lista de nodos disponibles:

![godot-create-new-node](img/nodes_and_scenes_03_create_node_window.webp)

Seleccione el nodo `Label` (Etiqueta). Puede escribir su nombre para filtrar la lista. Haga clic en el nodo `Label` (Etiqueta) para seleccionarlo y haga clic en el botón `Create` (Crear) en la parte inferior de la ventana:

![godot-label-node](img/nodes_and_scenes_04_create_label_window.webp)

Suceden muchas cosas cuando se agrega el primer nodo de una escena. La escena cambia al espacio de trabajo 2D porque `Label` es un tipo de nodo 2D. `Label` aparece seleccionada en la esquina superior izquierda de la ventana gráfica. El nodo aparece en el conjunto `Scene` a la izquierda y las propiedades del nodo aparecen en el conjunto `Inspector` a la derecha.

![godot-label-node-in-editor](img/nodes_and_scenes_05_editor_with_label.webp)

#### Cambiar las propiedades de un nodo

El siguiente paso es cambiar la propiedad `Text` (Texto) de la etiqueta. Cambiémosla a "Hola mundo". Dirígete al panel `Inspector` a la derecha de la ventana gráfica. Haz clic dentro del campo debajo de la propiedad `Text` y escribe _Hello World_.

![godot-label-node-in-editor](img/nodes_and_scenes_06_label_text.webp)

Verás cómo se presenta el texto en la ventana gráfica a medida que escribes.

> **Nota:** Puedes editar cualquier propiedad que aparezca en el `Inspector` como hicimos con `Text`.

Puedes mover el nodo `Label` en la ventana gráfica seleccionando la herramienta de `Move` en la barra de herramientas.

![godot-move-tool](img/nodes_and_scenes_07_move_tool.webp)

Con la escena `Label` seleccionada, haz clic sobre ella y arrastra en cualquier lugar de la ventana gráfica para moverla al centro de la vista delimitada por el rectángulo.

![godot-move-label-scene](img/nodes_and_scenes_08_hello_world_text.webp)

#### Ejecutar la escena

¡Todo está listo para ejecutar la escena! Pulsa el botón `Play Scene` en la parte superior derecha de la pantalla o pulsa `F6` (`Cmd + R` en macOS).

![godot-move-play-scene](img/nodes_and_scenes_09_play_scene_button.webp)

Una ventana emergente te invita a guardar la escena, lo cual es necesario para ejecutarla. Haz clic en el botón `Save` en el explorador de archivos para guardarla como `label.tscn`.

![godot-move-save-scene](img/nodes_and_scenes_10_save_scene_as.webp)

> **Nota:** El cuadro de diálogo `Save Scene As`, al igual que otros cuadros de diálogo de archivos en el editor, solo te permite guardar archivos dentro del proyecto. La ruta `res://` en la parte superior de la ventana representa el directorio raíz del proyecto y significa `resource path` (ruta de recursos). La escena se almacena en el formato de archivo `.tscn` (`text scene file format` o formato de archivo de escena en texto).

La aplicación debería abrirse en una nueva ventana y mostrar el texto _Hello World_.

![godot-hello-world](img/nodes_and_scenes_11_final_result.webp)

Cierre la ventana o presione `F8` (`Cmd + .` en macOS) para salir de la escena en ejecución.

### Creación de instancias

En la apartado anterior, vimos que una **escena** es una **colección de nodos organizados en una estructura de árbol**, con un solo nodo como raíz. Puedes dividir tu proyecto en cualquier cantidad de escenas. Esta función te ayuda a desglosar y organizar los diferentes componentes de tu juego.

Puedes crear tantas escenas como quieras y guardarlas como archivos con la extensión `.tscn`, que significa "escena de texto". El archivo `label.tscn` del apartado anterior fue un ejemplo. Llamamos a esos archivos `Packed Scenes` (escenas empaquetadas) porque contienen información sobre el contenido de tu escena.

A continuación, se muestra un ejemplo de una pelota. Está compuesta por un nodo `RigidBody2D` como raíz llamado `Ball` (un nodo `KinematicBody2D` que permite que la pelota caiga y rebote en las paredes), un nodo `Sprite2D` y un nodo `CollisionShape2D`:

![godot-ball](img/instancing_ball_scene.webp)

Una vez que hayas guardado una escena, esta funcionará como un **blueprint** (modelo): podrás reproducirla en otras escenas tantas veces como quieras. Replicar un objeto desde una plantilla como esta se denomina **instancing** (instanciación).

Como mencionamos anteriormente, las **escenas instanciadas** se comportan como un nodo: el editor oculta su contenido de manera predeterminada. Cuando instancias la escena `Ball`, solo verás el nodo `Ball`. Observa también cómo cada duplicado tiene un nombre único:

![godot-ball-instance](img/instancing_ball_instances_example.webp)

Cada instancia de la escena `Ball` comienza con la misma estructura y propiedades que `ball.tscn`. Sin embargo, puedes modificar cada una de forma independiente: por ejemplo cambiar cómo rebotan, qué tan pesadas son o cualquier propiedad expuesta por la escena de origen.

#### En la práctica

Usemos la **instanciación** en la práctica para ver cómo funciona en Godot. Te invitamos a descargar el proyecto de muestra de la pelota que preparamos para ti: [instancing_starter.zip](assets/paso-a-paso/instancing_starter.zip).

1. Extrae el archivo en tu computadora. Para importarlo, necesitas el `Project Manager`. Se accede al mismo abriendo Godot o, si ya tienes Godot abierto, haz clic en `Project > Quit to Project List` (`Ctrl + Shift + Q` en Windows, `Ctrl + Option + Cmd + Q` en macOS)
2. En el `Project Manager`, haz clic en el botón `Import` para importar el proyecto.

    ![godot-import](img/instancing_import_button.webp)

3. En la ventana emergente que aparece, navega hasta la carpeta que extrajiste. Haz doble clic en el archivo `project.godot` para abrirlo.

    ![godot-project-file](img/instancing_import_project_file.webp)

4. Por último, haz clic en el botón `Import & Edit`. Puede aparecer una ventana que le notifique que el proyecto se abrió por última vez en una versión anterior de Godot, pero no es un problema. Haga clic en el botón `Ok` para abrir el proyecto.

    ![godot-import-edit](img/instancing_import_and_edit_button.webp)

5. El proyecto contiene dos **escenas empaquetadas**: `main.tscn`, que contiene las paredes contra las que choca la pelota, y `ball.tscn`. La escena principal debería abrirse automáticamente. Si ve una escena 3D vacía en lugar de la escena principal, haga clic en el botón `2D` en la parte superior de la pantalla.

    ![godot-2D-scene](img/instancing_2d_scene_select.webp)

    ![godot-main-scene](img/instancing_main_scene.webp)

6. Agreguemos una pelota como nodo **Child** del nodo principal. En el panel de escenas, seleccione el nodo `Main`. Luego, haga clic en el ícono de vínculo en la parte superior del panel de **Scene**. Este botón le permite agregar una instancia de una escena como nodo **Child** del nodo seleccionado actualmente.

    ![godot-scene-link](img/instancing_scene_link_button.webp)

7. Haz doble clic en la escena `Ball.tscn` para crear una instancia de ella.

    ![godot-instance-child](img/instancing_instance_child_window.webp)

8. La pelota aparece en la esquina superior izquierda del _viewport_.

    ![godot-ball-instanced](img/instancing_ball_instanced.webp)

9. Haz clic en la pelota y arrástrala hacia el centro de la vista.

    ![godot-ball-moved](img/instancing_ball_moved.webp)

10. Ejecuta el proyecto pulsando el presionando `F5` (`Cmd + B` en macOS). Deberías verla caer.

11. Ahora, queremos crear más instancias del nodo Pelota. Con la pelota aún seleccionada, presiona `Ctrl + D` (`Cmd + D` en macOS) para ejecutar el comando de duplicar. Haz clic y arrastra para mover la nueva pelota a una ubicación diferente.

    ![godot-ball-duplicated](img/instancing_ball_duplicated.webp)

12. Puedes repetir este proceso hasta que tengas varias en la escena.

    ![godot-ball-multiplicated](img/instancing_main_scene_with_balls.webp)

13. Vuelve a jugar. Ahora deberías ver que todas las bolas caen independientemente unas de otras. Esto es lo que hacen las instancias. Cada una es una reproducción independiente de una escena de plantilla.

#### Edición de escenas e instancias

Las instancias ofrecen mucho más que eso. Con esta función, puedes:

- Cambiar las propiedades de una bola sin afectar a las demás usando el `Inspector`.
- Cambiar las propiedades predeterminadas de cada bola abriendo la escena `Ball.tscn` y haciendo un cambio en el nodo `Ball` que se encuentra allí. Al guardar, todas las instancias de la bola en el proyecto verán sus valores actualizados.

> **Nota:** Cambiar una propiedad en una instancia siempre anula los valores de la escena empaquetada correspondiente.

Probemos esto. Haz doble clic en `Ball.tscn` en el dock `FileSystem` para abrirlo.

![godot-ball-scene-opening](img/instancing_ball_scene_open.webp)

Selecciona el nodo `Ball`. En el `Inspector` de la derecha, haz clic en la propiedad `PhysicsMaterial` para expandirla.

![godot-physics-material-expand](img/instancing_physics_material_expand.webp)

Establezca su propiedad Bounce en `0.5` haciendo clic en el campo numérico, escribiendo `0.5` y presionando la tecla `Enter`.

![godot-bounce-updated](img/instancing_property_bounce_updated.webp)

Ejecute el proyecto con `F5` (`Cmd + B` en macOS) y observe cómo todas las pelotas rebotan mucho más. Como la escena `Ball` es una plantilla para todas las instancias, modificarla y guardarla hace que todas las instancias se actualicen en consecuencia.

Ahora ajustemos una instancia individual. Regrese a la escena principal haciendo clic en la pestaña `Main` sobre la ventana gráfica.

![godot-main-scene](img/instancing_scene_tabs.webp)

Selecciona uno de los nodos de bola instanciados y, en el `Inspector`, establece el valor de **Gravity Scale** en `10`.

![godot-gravity-scale](img/instancing_property_gravity_scale.webp)

Aparece un botón gris "revertir" junto a la propiedad ajustada.

![godot-revert-icon](img/instancing_property_revert_icon.webp)

Este icono indica que estás anulando un valor de la escena empaquetada de origen. Incluso si modificas la propiedad en la escena original, el valor anulado se conservará en la instancia. Al hacer clic en el icono de revertir, se restaurará la propiedad al valor de la escena guardada.

Vuelve a ejecutar el juego y observa cómo esta bola ahora cae mucho más rápido que las demás.

> **Nota:** Puedes notar que no puedes cambiar los valores del **PhysicsMaterial** de la bola. Esto se debe a que **PhysicsMaterial** es un _recurso_ (resource) y debe hacerse único antes de poder editarlo en una escena que se vincula a su escena original. Para hacer que un recurso sea único para una instancia, haga clic derecho en la propiedad **Physics Material** en el **Inspector** y haga clic en `Make Unique` en el menú contextual.
>
> Los **resources** son otro componente esencial de los juegos de Godot que abordaremos en una lección posterior.

#### Las instancias de escena como lenguaje de diseño

Las instancias y escenas en Godot ofrecen un lenguaje de diseño excelente, que distingue al motor de otros. Diseñamos Godot en torno a este concepto desde cero.

Recomendamos descartar los patrones de código arquitectónico al crear juegos con Godot, como los diagramas Modelo-Vista-Controlador (MVC) o Entidad-Relación. En su lugar, puedes empezar imaginando los elementos que verán los jugadores en tu juego y estructurar tu código en torno a ellos.

Por ejemplo, puedes desglosar un _shooter game_ de la siguiente manera:

![godot-shooter-diagram](img/instancing_diagram_shooter.webp)

Puedes crear un diagrama como este para casi cualquier tipo de juego. Cada rectángulo representa una entidad que es visible en el juego desde la perspectiva del jugador. Las flechas te indican qué escena es la dueña de qué.

Una vez que tengas un diagrama, recomendamos crear una escena para cada elemento que aparece en él para desarrollar tu juego. Usarás instancias, ya sea por código o directamente en el editor, para construir tu árbol de escenas.

Los programadores tienden a pasar mucho tiempo diseñando arquitecturas abstractas e intentando encajar componentes en ellas. El diseño basado en escenas hace que el desarrollo sea más rápido y sencillo, lo que te permite concentrarte en la lógica del juego en sí. Debido a que la mayoría de los componentes del juego se asignan directamente a una escena, usar un diseño basado en la instanciación de escenas significa que necesitas poco código arquitectónico adicional.

A continuación, se muestra un ejemplo de un diagrama de escena para un _open-world game_ con toneladas de activos y elementos anidados:

![godot-open-world-diagram](img/instancing_diagram_open_world.webp)

Imagina que comenzamos creando la habitación. Podríamos hacer un par de escenas de habitaciones diferentes, con arreglos únicos de muebles en ellas. Más tarde, podríamos hacer una escena de casa que use múltiples instancias de habitación para el interior. Crearíamos una ciudadela a partir de muchas casas instanciadas y un gran terreno en el que colocaríamos la ciudadela. Cada una de estas sería una escena que instanciaría una o más subescenas.

Más tarde, podríamos crear escenas que representen a los guardias y agregarlas a la ciudadela. Se agregarían indirectamente al mundo general del juego.

Con Godot, es fácil iterar sobre tu juego de esta manera, ya que todo lo que necesitas hacer es crear e instanciar más escenas. Diseñamos el editor para que sea accesible para programadores, diseñadores y artistas por igual. Un proceso típico de desarrollo en equipo puede involucrar a artistas 2D o 3D, diseñadores de niveles, diseñadores de juegos y animadores, todos trabajando con el editor Godot.

#### Resumen

La **instanciación**, el proceso de producir un objeto a partir de un _blueprint_, tiene muchos usos prácticos. Con las escenas, te brinda:

- La capacidad de dividir tu juego en componentes reutilizables.
- Una herramienta para estructurar y encapsular sistemas complejos.
- Un lenguaje para pensar en la estructura de tu proyecto de juego de una manera natural.

### Lenguajes de programación

Esta lección le dará una descripción general de los lenguajes de programación disponibles en Godot. Aprenderá las ventajas y desventajas de cada opción. En la siguiente sección, escribirá su primer script usando GDScript.

**Los scripts se adjuntan a un nodo y extienden su comportamiento**. Esto significa que los scripts heredan todas las _funciones_ y _propiedades_ del nodo al que se adjuntan.

Por ejemplo, tome un juego donde un nodo `Camera2D` sigue a un barco. El nodo `Camera2D` sigue a su padre de manera predeterminada. Imagine que desea que la cámara tiemble cuando el jugador recibe daño. Como esta característica no está incorporada en Godot, adjuntaría un script al nodo `Camera2D` y codificaría el movimiento:

![godot-scripting-camera-shake](img/scripting_camera_shake.gif)

#### Lenguajes de programación disponibles

Godot ofrece **cuatro lenguajes de programación de juegos**: `GDScript`, `C#` y, a través de su tecnología _GDExtension_, `C` y `C++`. Hay más lenguajes compatibles con la comunidad, pero estos son los oficiales.

Puedes usar varios lenguajes en un solo proyecto. Por ejemplo, en un equipo, puedes codificar la lógica del juego en GDScript, ya que es rápido de escribir, y usar C# o C++ para implementar algoritmos complejos y maximizar su rendimiento. O puedes escribir todo en GDScript o C#. Tú decides.

Ofrecemos esta flexibilidad para responder a las necesidades de diferentes proyectos de juegos y desarrolladores.

#### ¿Qué lenguaje debo usar?

Si eres principiante, te recomendamos **comenzar con GDScript**. Creamos este lenguaje específicamente para Godot y las necesidades de los desarrolladores de juegos. Tiene una sintaxis liviana y sencilla, y proporciona la integración más estrecha con Godot.

![godot-gdscripting](img/scripting_gdscript.webp)

Para C#, necesitarás un editor de código externo como VSCode o Visual Studio. Si bien el soporte de C# ya está maduro, encontrarás menos recursos de aprendizaje para él en comparación con GDScript. Es por eso que recomendamos C# principalmente a los usuarios que ya tienen experiencia con el lenguaje.

Veamos las características de cada lenguaje, así como sus pros y contras.

##### GDScript 

GDScript es un lenguaje de programación _orientado a objetos_ e _imperativo_ creado para Godot. Está hecho por y para desarrolladores de juegos para ahorrarte tiempo en la codificación de juegos. Sus características incluyen:

- Una sintaxis simple que genera archivos cortos.
- Tiempos de compilación y carga increíblemente rápidos.
- Integración estricta con el editor, con autocompletado de código para nodos, señales y más elementos de la escena a la que está conectado.
- Tipos de vector y transformación integrados, lo que lo hace eficiente para un uso intensivo del álgebra lineal, algo imprescindible para los juegos.
- Admite múltiples subprocesos con la misma eficiencia que los lenguajes con tipado estático.
- No hay _garbage collection_ (recolección de basura), ya que esta característica eventualmente se interpone al crear juegos. El motor cuenta las referencias y administra la memoria por en la mayoría de los casos de forma predeterminada, pero también puedes controlar la memoria si lo necesitas.
- _Gradual typing_ (tipado gradual). Las variables tienen tipos dinámicos de forma predeterminada, pero también puedes usar sugerencias de tipo para realizar comprobaciones de tipo estrictas.

GDScript se parece a Python ya que estructura los bloques de código usando indentación, pero no funciona de la misma manera en la práctica. Está inspirado en varios lenguajes, incluidos Squirrel, Lua y Python.

> **Nota:** 
>
>¿Por qué no usamos Python o Lua directamente?
>
> Hace años, Godot usó Python, luego Lua. La integración de ambos lenguajes requirió mucho trabajo y tenía limitaciones severas. Por ejemplo, la compatibilidad con subprocesos fue un gran desafío con Python.
>
> Desarrollar un lenguaje dedicado no nos lleva más trabajo y podemos adaptarlo a las necesidades de los desarrolladores de juegos. Ahora estamos trabajando en optimizaciones de rendimiento y características que habrían sido difíciles de ofrecer con lenguajes de terceros.

##### .NET / C#

Como **C#** de Microsoft es uno de los favoritos entre los desarrolladores de juegos, lo admitimos oficialmente. C# es un lenguaje maduro y flexible con toneladas de bibliotecas escritas para él. Pudimos agregarle compatibilidad gracias a una generosa donación de Microsoft.

![godot-scripting-csharp](img/scripting_csharp.webp)

C# ofrece un buen equilibrio entre rendimiento y facilidad de uso, aunque debe tener en cuenta su recolector de basura.

> **Nota:** Debes usar la edición .NET del editor Godot para crear scripts en C#. Puedes descargarla en la página de descargas del sitio web de Godot.

Dado que Godot usa .NET 6, en teoría, puedes usar cualquier biblioteca o framework .NET de terceros en Godot, así como cualquier lenguaje de programación compatible con Common Language Infrastructure, como F#, Boo o ClojureCLR. Sin embargo, C# es la única opción .NET oficialmente compatible.

> **Nota:** El código GDScript en sí no se ejecuta tan rápido como el C# o C++ compilado. Sin embargo, la mayoría del código de script llama a funciones escritas con algoritmos rápidos en código C++ dentro del motor. En muchos casos, escribir la lógica del juego en GDScript, C# o C++ no tendrá un impacto significativo en el rendimiento.

> **Atención:** Los proyectos escritos en C# con Godot 4 actualmente no se pueden exportar a la plataforma web. Para usar C# en esa plataforma, considera Godot 3 en su lugar. La compatibilidad con plataformas Android e iOS está disponible a partir de Godot 4.2, pero es experimental y se aplican algunas limitaciones.

##### C++ a través de GDExtension

GDExtension te permite escribir código de juego en C++ sin necesidad de volver a compilar Godot.

![godot-scripting-cpp](img/scripting_cpp.webp)

Puedes usar cualquier versión del lenguaje o combinar marcas y versiones de compiladores para las bibliotecas compartidas generadas, gracias a nuestro uso de un puente de API C interno.

GDExtension es la mejor opción para el rendimiento. No necesitas usarlo en todo un juego, ya que puedes escribir otras partes en GDScript o C#.

Al trabajar con GDExtension, los tipos, funciones y propiedades disponibles se parecen mucho a la API C++ real de Godot.

#### Resumen

Los scripts son archivos que contienen código que adjuntas a un nodo para ampliar su funcionalidad.

Godot es compatible con cuatro lenguajes de programación oficiales, lo que te ofrece flexibilidad entre rendimiento y facilidad de uso.

Puedes combinar lenguajes, por ejemplo, para implementar algoritmos exigentes con C o C++ y escribir la mayor parte de la lógica del juego con GDScript o C#.

### Creando tu primer script

En esta lección, codificará su primer script para hacer que el ícono de Godot gire en círculos usando GDScript. Como mencionamos en la introducción, asumimos que tiene conocimientos básicos de programación.

![godot-scripting-cpp](img/scripting_first_script_rotating_godot.webp)

#### Configuración del proyecto

**Cree un nuevo proyecto** para empezar desde cero. Su proyecto debe contener una imagen: el ícono de Godot, que usamos a menudo para crear prototipos en la comunidad.

Necesitamos crear un nodo `Sprite2D` para mostrarlo en el juego. En el panel Escena, haga clic en el botón Otro nodo.

![godot-other-node](img/scripting_first_script_click_other_node.webp)

Escriba "Sprite2D" en la barra de búsqueda para filtrar los nodos y haga doble clic en `Sprite2D` para crear el nodo.

![godot-sprite-node](img/scripting_first_script_add_sprite_node.webp)

Su pestaña `Scene` ahora solo debe tener un nodo Sprite2D.

![godot-sprite2D-node](img/scripting_first_script_scene_tree.webp)

Un nodo Sprite2D necesita una textura para mostrarse. En el `Inspector` de la derecha, puedes ver que la propiedad `Texture` dice "[empty]". Para mostrar el ícono de Godot, haz clic y arrastra el archivo `icon.svg` desde el dock **FileSystem** hasta la caja `Texture`.

![godot-texture](img/scripting_first_script_setting_texture.webp)

> **Nota:** Puedes crear nodos Sprite2D automáticamente arrastrando y soltando imágenes en la ventana gráfica.

Luego, haz clic y arrastra el ícono en el _viewport_ para centrarlo en la vista del juego.

![godot-sprite-centered](img/scripting_first_script_centering_sprite.webp)

#### Creación de un nuevo script

Para crear y adjuntar un nuevo script a nuestro nodo, haga clic derecho en Sprite2D en el dock **Scene** y seleccione `Attach Script`.

![godot-attach-script](img/scripting_first_script_attach_script.webp)

Aparece la ventana `Attach Node Script`. Te permite seleccionar el idioma y la ruta del archivo del script, entre otras opciones.

Cambiá el campo `Template` a `Empty` para comenzar con un archivo limpio. Deje las otras opciones configuradas con sus valores predeterminados y haga clic en el botón `Create` para crear el script.

![godot-create-script](img/scripting_first_script_attach_node_script.webp)

El espacio de trabajo de **Script** debería aparecer con el nuevo archivo `sprite_2d.gd` abierto y la siguiente línea de código:

```
extends Sprite2D
```

Cada archivo GDScript es implícitamente una clase. La palabra clave `extends` define la clase que hereda o extiende este script. En este caso, es **Sprite2D**, lo que significa que nuestro script tendrá acceso a todas las propiedades y funciones del nodo Sprite2D, incluidas las clases que extiende, como **Node2D**, **CanvasItem** y **Node**.


> **Nota:** En GDScript, si omite la línea con la palabra clave `extends`, su clase extenderá implícitamente `RefCounted`, que Godot usa para administrar la memoria de su aplicación.

Las **propiedades heredadas** incluyen las que puede ver en el panel `Inspector`, como la `texture` de nuestro nodo.

> **Nota:** De manera predeterminada, el `Inspector` muestra las propiedades de un nodo en _Title Case_, con las palabras en mayúsculas separadas por un espacio. En el código GDScript, estas propiedades están en _snake_case_, que es minúscula y las palabras se separan con un guión bajo.
>
> Puedes pasar el cursor sobre el nombre de cualquier propiedad en el Inspector para ver una descripción y su identificador en el código.

#### ¡Hola, mundo!

Actualmente, nuestro script no hace nada. Hagamos que imprima el texto "¡Hola, mundo!" en el panel inferior `Output` para comenzar.

Agregue el siguiente código a su script:

```
func _init():
	print("¡Hola, mundo!")
```

Vamos a desglosarlo. La palabra clave `func` define una nueva _función_ llamada `_init`. Este es un nombre especial para el constructor de la clase. El motor llama a `_init()` en cada objeto o nodo al crearlo en la memoria, si se define esta función.

> **Nota:** GDScript es un lenguaje basado en indentación. La tabulación al comienzo de la línea que dice `print()` es necesaria para que el código funcione. Si la omite o no indenta una línea correctamente, el editor la resaltará en rojo y mostrará el siguiente mensaje de error: _Indented block expected_.

Guarde la escena como `sprite_2d.tscn` si aún no lo ha hecho, luego presione `F6` (`Cmd + R` en macOS) para ejecutarla. Observa el panel inferior de Salida que se expande. Debería mostrar "¡Hola, mundo!".

![godot-hello-world](img/scripting_first_script_print_hello_world.webp)

Elimina la función `_init()`, de modo que solo te quede la línea `extends Sprite2D`.

#### Dando la vuelta

Es hora de hacer que nuestro nodo se mueva y rote. Para ello, vamos a añadir dos variables miembro a nuestro script: la velocidad de movimiento en píxeles por segundo y la velocidad angular en radianes por segundo. Añade lo siguiente después de la línea de `extends Sprite2D`:

```
var speed = 400
var angular_speed = PI
```

Las **member variables** (variables miembro) se encuentran cerca de la parte superior del script, después de cualquier línea de extensión, pero antes de las funciones. Cada instancia de nodo con este script adjunto tendrá su propia copia de las propiedades `speed` y `angular_speed`.

> **Nota:** Los ángulos en Godot funcionan en radianes de forma predeterminada, pero tienes funciones y propiedades integradas disponibles si prefieres calcular los ángulos en grados.

Para mover nuestro ícono, necesitamos actualizar su posición y rotación en cada cuadro del bucle del juego. Podemos usar la función virtual `_process()` de la clase **Node**. Si lo defines en cualquier clase que extienda la clase **Node**, como **Sprite2D**, Godot llamará a la función en cada cuadro y le pasará un argumento llamado `delta`, el tiempo transcurrido desde el último cuadro.

> **Nota:** Los juegos funcionan renderizando muchas imágenes por segundo, cada una llamada _cuadro_, y lo hacen en un bucle. Medimos la velocidad a la que un juego produce imágenes en _cuadros por segundo_ (FPS o frames per second). La mayoría de los juegos apuntan a 60 FPS, aunque puedes encontrar cifras como 30 FPS en dispositivos móviles más lentos o de 90 a 240 para juegos de realidad virtual.
>
> El motor y los desarrolladores de juegos hacen todo lo posible para actualizar el mundo del juego y renderizar imágenes en un intervalo de tiempo constante, pero siempre hay pequeñas variaciones en los tiempos de renderizado de cuadros. Es por eso que el motor nos proporciona este valor de tiempo `delta`, lo que hace que nuestro movimiento sea independiente de nuestra velocidad de cuadros.

En la parte inferior del script, define la función:

```
func _process(delta):
	rotation += angular_speed * delta
```

La palabra clave `func` define una nueva función. Después, tenemos que escribir el nombre de la función y los argumentos que toma entre paréntesis. La definición termina con dos puntos y los bloques sangrados que siguen son el contenido o las instrucciones de la función.

> **Nota:** Observa cómo `_process()`, al igual que `_init()`, comienza con un guión bajo inicial. Por convención, las _funciones virtuales_ de Godot, es decir, las funciones integradas que puedes anular para comunicarte con el motor, comienzan con un guión bajo.

La línea dentro de la función, `rotation += angular_speed * delta`, incrementa la rotación de nuestro sprite en cada cuadro. Aquí, rotation es una propiedad heredada de la clase Node2D, que Sprite2D extiende. Controla la rotación de nuestro nodo y funciona con radianes.

> **Sugerencia:** En el editor de código, puedes hacer `Ctrl + clic` (`Cmd + clic` en MacOS) en cualquier propiedad o función integrada como `position`, `rotation` o `_process()` para abrir la documentación correspondiente en una nueva pestaña.

Ejecuta la escena para ver el ícono de Godot girar en el lugar.

![godot-icon-turning-in-place](img/scripting_first_script_godot_turning_in_place.webp)

#### Avanzando

Ahora hagamos que el nodo se mueva. Agrega las siguientes dos líneas dentro de la función `_process()`, asegurándote de que las nuevas líneas estén sangradas de la misma manera que la línea `rotación += angular_speed * delta` anterior a ellas.

```
var velocity = Vector2.UP.rotated(rotation) * speed

position += velocity * delta
```

Como ya vimos, la palabra clave `var` define una nueva variable. Si la colocas en la parte superior del script, define una _propiedad de la clase_. Dentro de una función, define una _variable local_: solo existe dentro del alcance de la función.

Definimos una variable local llamada `velocity`, un vector 2D que representa tanto una dirección como una velocidad. Para hacer que el nodo se mueva hacia adelante, comenzamos con la constante `Vector2.UP` de la clase Vector2, un vector que apunta hacia arriba, y lo rotamos llamando al método Vector2 `rotated()`. Esta expresión, `Vector2.UP.rotated(rotation)`, es un vector que apunta hacia adelante en relación con nuestro ícono. Multiplicado por nuestra propiedad `speed`, nos da una velocidad que podemos usar para mover el nodo hacia adelante.

Agregamos `velocity * delta` a la propiedad `position` del nodo para moverlo. La posición en sí es del tipo Vector2, un tipo incorporado en Godot que representa un vector 2D.

Ejecuta la escena para ver la cabeza de Godot correr en círculos.

![godot-icon-rotating-icon](img/scripting_first_script_rotating_godot.webp)

> **Nota:** Mover un nodo de esa manera no tiene en cuenta la colisión con las paredes o el piso. En tu primer juego 2D, aprenderás otro enfoque para mover objetos mientras detectas colisiones.

Nuestro nodo actualmente se mueve solo. En la siguiente parte, [Escuchando el input del jugador](#escuchando-el-input-del-jugador), usaremos un _input_ del jugador para controlarlo.

#### Script completo

Aquí está el archivo `sprite_2d.gd` completo como referencia:

```
extends Sprite2D

var speed = 400
var angular_speed = PI


func _process(delta):
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
```

### Escuchando el input del jugador

Sobre la base de la lección anterior, [Creando tu primer script](#creando-tu-primer-script), veremos otra característica importante de cualquier juego: dar control al jugador. Para agregar esto, necesitamos modificar nuestro código `sprite_2d.gd`.

![godot-moving-with-input](img/scripting_first_script_moving_with_input.webp)

Tenés dos herramientas principales para procesar el input del jugador en Godot:

1. Los **built-in input callbacks** (funciones de retroalimentación de entrada integradas), principalmente `_unhandled_input()`. Al igual que `_process()`, es una función virtual integrada que Godot llama cada vez que el jugador presiona una tecla. Es la herramienta que desea utilizar para reaccionar a eventos que no ocurren en cada cuadro, como por ejemplo presionar la barra espaciadora para saltar.

2. El **singleton** `Input`. Un singleton es un objeto de acceso global. Godot proporciona acceso a varios de estos objetos en los scripts. Es la herramienta adecuada para verificar la entrada en cada cuadro.

Vamos a utilizar el singleton `Input` aquí, ya que necesitamos saber si el jugador quiere girar o moverse _en cada cuadro_.

Para girar, deberíamos utilizar una nueva variable: `direction`. En nuestra función `_process()`, reemplaza la línea `rotation += angular_speed * delta` con el código que se muestra a continuación:

```
var direction = 0
if Input.is_action_pressed("ui_left"):
	direction = -1
if Input.is_action_pressed("ui_right"):
	direction = 1

rotation += angular_speed * direction * delta
```

Nuestra variable local `direction` es un multiplicador que representa la dirección en la que el jugador quiere girar. Un valor de `0` significa que el jugador no está presionando la tecla de flecha izquierda o derecha. Un valor de `1` significa que el jugador quiere girar a la derecha y `-1` significa que quiere girar a la izquierda.

Para producir estos valores, introducimos condiciones y el uso de `Input`. Una condición comienza con la palabra clave `if` en GDScript y termina con `dos puntos (:)`. La condición es la expresión entre la palabra clave y el final de la línea.

Para comprobar si se presionó una tecla en este cuadro, llamamos a `Input.is_action_pressed()`. El método toma una cadena de texto que representa una acción de entrada y devuelve `true` si se presionó la acción, `false` en caso contrario.

Las dos acciones que usamos arriba, `ui_left` y `ui_right`, están predefinidas en cada proyecto de Godot. Se activan respectivamente cuando el jugador presiona las flechas izquierda y derecha en el teclado o izquierda y derecha en el D-pad de un gamepad.

> **Nota:** Puedes ver y editar las acciones de entrada en tu proyecto yendo a `Project > Project Settings` y haciendo clic en la pestaña `Input Map`.

Por último, usamos `direction` como multiplicador cuando actualizamos la variable `rotation` del nodo: `rotation += angular_speed * direction * delta`.

Comente las líneas `var velocity = Vector2.UP.rotated(rotation) * speed` y `position += velocity * delta` de esta manera:

```
#var velocity = Vector2.UP.rotated(rotation) * speed

#position += velocity * delta
```

Esto **ignorará** el código que movió la posición del ícono en un círculo sin la intervención del usuario del ejercicio anterior.

Si ejecuta la escena con este código, el ícono debería rotar cuando presione las flechas `Left` y `Right`.

#### Movimiento al presionar la tecla "Up"

Para movernos solo al presionar una tecla `Up`, necesitamos modificar el código que calcula la velocidad. Quita los comentarios del código y reemplaza la línea que comienza con `var velocity` por el código que se muestra a continuación:

```
var velocity = Vector2.ZERO
if Input.is_action_pressed("ui_up"):
	velocity = Vector2.UP.rotated(rotation) * speed
```

Inicializamos `velocity` con un valor de `Vector2.ZERO`, otra constante del tipo _Vector_ incorporado que representa un vector 2D de longitud 0.

Si el jugador presiona la tecla `ui_up`, entonces actualizamos el valor de la velocidad, lo que hace que el sprite se mueva hacia adelante.

#### Script completo

A continuación se incluye el archivo `sprite_2d.gd` completo como referencia:

```
extends Sprite2D

var speed = 400
var angular_speed = PI


func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1

	rotation += angular_speed * direction * delta

	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed

	position += velocity * delta
```

Si ejecuta la escena, ahora debería poder rotar con las teclas de flecha izquierda y derecha y avanzar presionando `Up`.

![godot-icon-moving-up](img/scripting_first_script_moving_with_input.webp)

#### Resumen

En resumen, cada script en Godot representa una _clase_ y _extiende_ una de las clases integradas del motor. Los tipos de nodos de los que _heredan_ tus clases te dan acceso a _propiedades_, como `rotation` y `position` en el caso de nuestro sprite. También heredas muchas funciones, que no pudimos usar en este ejemplo.

En GDScript, las _variables_ que colocas en la parte superior del archivo son las propiedades de tu clase, también llamadas _variables miembro_. Además de las variables, puedes definir _funciones_, que, en su mayor parte, serán los métodos de tus clases.

Godot proporciona varias _funciones virtuales_ que puedes definir para conectar tu clase con el motor. Estas incluyen `_process()`, para aplicar cambios al nodo en cada cuadro, y `_unhandled_input()`, para recibir eventos de entrada como pulsaciones de teclas y botones de los usuarios. Hay bastantes más.

El _singleton_ `Input` te permite reaccionar a la entrada de los jugadores en cualquier parte de tu código. En particular, podrás usarlo en el bucle `_process()`.

En la próxima lección, [Uso de señales](#uso-de-señales), desarrollaremos la relación entre scripts y nodos haciendo que nuestros nodos activen código en scripts.

### Uso de señales

En esta lección, veremos las **signals** (señales). Son mensajes que emiten los nodos cuando les sucede algo específico, por ejemplo: como cuando se presiona un botón. Otros nodos pueden conectarse a esa señal y llamar a una función cuando ocurre el evento.

Las señales son un mecanismo de delegación integrado en Godot que permite que un objeto de juego reaccione a un cambio en otro sin que se hagan referencia entre sí. El uso de señales limita el acoplamiento y mantiene la flexibilidad del código.

Por ejemplo, puede tener una barra de vida en la pantalla que represente la salud del jugador. Cuando el jugador recibe daño o usa una poción curativa, desea que la barra refleje el cambio. Para poder hacerlo en Godot, se usan señales.

Desde Godot 4.0, los métodos (`Callable`) y las señales son un tipo de primera clase. Esto significa que puede pasarlas como argumentos de método directamente sin tener que pasarlas como cadenas, lo que permite un mejor autocompletado y es menos propenso a errores. Consulte la referencia de la clase `Signal` para obtener una lista de lo que puede hacer con el tipo `Signal` directamente.

> **Consulte también:** Como mencionamos en la introducción, las señales son la versión de Godot del patrón observador. Puede obtener más información sobre esto en [Patrones de programación de juegos](https://gameprogrammingpatterns.com/observer.html).

Ahora usaremos una señal para hacer que nuestro ícono de Godot de la lección anterior [Escuchando el input del jugador](#escuchando-el-input-del-jugador) se mueva y se detenga al presionar un botón.

> **Nota:** Para este proyecto, seguiremos las convenciones de nomenclatura de Godot.
>
> - **GDScript:** las clases (nodos) usan **PascalCase**, las variables y funciones usan `snake_case` y las constantes usan `ALL_CAPS` (consulte [la guía de estilo de GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#doc-gdscript-styleguide)).
>
> - **C#:** las clases, las variables de exportación y los métodos usan `PascalCase`, los campos privados usan `_camelCase`, las variables locales y los parámetros usan `camelCase` (consulte la [guía de estilo de C#](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/c_sharp_style_guide.html#doc-c-sharp-styleguide)). Tenga cuidado de escribir los nombres de los métodos de forma precisa para evitar problemas al conectar las señales.

#### Configuración de la escena

Para agregar un **botón** a nuestro juego, crearemos una nueva escena que incluirá tanto un `Button` como la escena `sprite_2d.tscn` que creamos en la lección [Creando tu primer script](#creando-tu-primer-script).

1. Crea una nueva escena yendo al menú `Scene > New Scene`.

    ![new-scene](img/signals_01_new_scene.webp)

2. En el dock **Scene**, haz clic en el botón **2D Scene**. Esto agregará un _Node2D_ como raíz.

    ![2d-scene](img/signals_02_2d_scene.webp)

3. En el dock **FileSystem**, haz clic y arrastra el archivo `sprite_2d.tscn` que guardaste anteriormente sobre el _Node2D_ para crear una instancia del mismo.

    ![new-instance](img/signals_03_dragging_scene.webp)

4. Queremos agregar otro nodo como hermano del _Sprite2D_. Para hacerlo, haz clic derecho en **Node2D** y selecciona `Add Child Node`.

    ![add-child-node](img/signals_04_add_child_node.webp)

5. Busca el nodo `Button` y agrégalo.

    ![add-button](img/signals_05_add_button.webp)

6. De manera predeterminada el nodo es pequeño. Haz clic y arrastra el controlador inferior derecho del botón en la ventana gráfica para cambiar su tamaño:

    ![drag-button](img/signals_06_drag_button.webp)

7. Si no ves los controladores, asegúrate de que la herramienta de selección `Select Mode (Q)` esté activa en la barra de herramientas. Haz clic y arrastra `Button` para acercarlo al sprite.

    ![select-tool](img/signals_07_select_tool.webp)

8. También puedes escribir una etiqueta en `Button` editando su propiedad `Text` en `Inspector`. Ingresa `Toggle motion`.

    ![toggle-motion-text](img/signals_08_toggle_motion_text.webp)

9. Tu ​​árbol de escena y ventana gráfica deberían verse así.

    ![scene-setup](img/signals_09_scene_setup.webp)

Guarda la escena que acabas de crear como `node_2d.tscn`, si aún no lo has hecho. Luego, puedes ejecutarla con `F6` (`Cmd + R` en macOS). En este momento, el botón estará visible, pero no sucederá nada si lo presionas.

#### Conexión de una señal en el editor

Aquí queremos conectar la señal `pressed` de `Button` con nuestro _Sprite2D_ y llamar a una nueva función que activará o desactivará su movimiento. Necesitamos tener un script adjunto al nodo _Sprite2D_, lo cual hicimos en la lección anterior

10. Las señales pueden ser conectadas en el panel **Node**. ​​Seleccione el nodo `Button` y, en el lado derecho del editor, haga clic en la pestaña denominada **Node** junto al **Inspector**.

    ![select-tool](img/signals_10_node_dock.webp)

11. El dock muestra una _lista de señales disponibles_ para el nodo seleccionado. Haga doble clic en la señal `pressed()` para abrir la ventana `Connect a Signal to a Method`.

    ![select-tool](img/signals_11_pressed_signals.webp)

12. Aquí puedes conectar la señal al nodo `Sprite2D`. El nodo necesita un _método receptor_, una función que Godot llamará cuando el botón emita la señal. El editor genera uno para ti. Por convención, llamamos a estos métodos de devolución de llamada **_on_node_name_signal_name**. Aquí, será `_on_button_pressed`:

    ![select-tool](img/signals_12_node_connection.webp)

> **Nota:** Al conectar señales a través del dock `Node` del editor, puedes usar dos modos. El modo _simple_ solo te permite conectarte a nodos que tengan un script adjunto y crea una nueva función de devolución de llamada (callback) en ellos.
>
>    ![select-tool](img/signals_advanced_connection_window.webp)
>
> La modo _avanzado_ te permite conectarte a cualquier nodo y a cualquier función incorporada, agregar argumentos a la devolución de llamada y configurar opciones. Puedes alternar el modo en la parte inferior derecha de la ventana haciendo clic en el botón `Advanced`.

> **Nota:** Si estás usando un editor externo (como VS Code), es posible que esta generación automática de código no funcione. En este caso, debes conectar la señal a través del código como se explica en la siguiente sección [Conexión de una señal mediante código](#conexión-de-una-señal-mediante-código).

13. Luego de seleccionar el nodo `Sprite2D`, clic en el botón `Connect` para completar la conexión de la señal y saltar al espacio de trabajo de **Script**. Deberías ver el nuevo método con un **ícono de conexión** en el margen izquierdo.

    ![select-tool](img/signals_13_signals_connection_icon.webp)

14. Si haces clic en el **ícono de conexión**, aparece la ventana **Connections to method** que muestra información sobre la conexión. Esta función solo está disponible cuando se conectan nodos en el editor.

    ![select-tool](img/signals_14_signals_connection_info.webp)

Reemplacemos la línea con la palabra clave `pass` con el código que alternará el movimiento del nodo.

Nuestro `Sprite2D` se mueve gracias al código en la función `_process()`. Godot proporciona un método para activar y desactivar el procesamiento: `Node.set_process()`. Otro método de la clase **Node**, `is_processing()`, devuelve `true` si el procesamiento inactivo está activo. Podemos usar la palabra clave `not` para invertir el valor.

```
func _on_button_pressed():
	set_process(not is_processing())
```

Esta función activará y desactivará el procesamiento y, a su vez, el movimiento del ícono al presionar el botón.

Antes de probar el juego, debemos simplificar nuestra función `_process()` para mover el nodo automáticamente y no esperar la entrada del usuario. Reemplácela con el siguiente código, que vimos hace dos lecciones:

```
func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
```

El código `sprite_2d.gd` completo debería verse como el siguiente.

```
extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_button_pressed():
	set_process(not is_processing())
```

Ejecute la escena (`F6`) ahora y haga clic en el botón para ver cómo se detiene o se reinicia el movimiento del sprite.

#### Conexión de una señal mediante código

Puedes conectar señales mediante código en lugar de usar el editor. Esto es necesario cuando creas _nodos_ o cuando realizas _instanciación_ de escenas dentro de un script.

Usemos un nodo diferente aquí. Godot tiene un nodo `Timer` que es útil para implementar tiempos de recuperación de habilidades, recarga de armas y más.

Regresa al espacio de trabajo **2D**. Puedes hacer clic en el texto **2D** en la parte superior de la ventana o presionar `Ctrl + F1` (`Ctrl + Cmd + 1` en macOS).

En el dock **Scene**, haz clic derecho en el nodo `Sprite2D` y agrega un nuevo nodo hijo. Busca `Timer` y agrega el nodo correspondiente. Tu escena ahora debería verse así:

![scene-tree](img/signals_15_scene_tree.webp)

Con el nodo `Timer` seleccionado, ve al **Inspector** y habilita la propiedad `Autostart`.

![timer](img/signals_18_timer_autostart.webp)

Haga clic en el icono de script junto al nodo `Sprite2D` para volver al espacio de trabajo de script.

![click-script](img/signals_16_click_script.webp)

Necesitamos realizar dos operaciones para conectar los nodos mediante código:

1. Obtener una referencia a **Timer** desde `Sprite2D`.
2. Llamar al método `connect()` en la señal `timeout` de **Timer**.

> **Nota:** Para conectarse a una señal mediante código, debe llamar al método `connect()` de la señal que desea escuchar. En este caso, queremos escuchar la señal `timeout` de **Timer**.

Queremos conectar la señal cuando se crea una instancia de la escena, y podemos hacerlo utilizando la función incorporada `Node._ready()`, que el motor llama automáticamente cuando se crea una instancia completa de un nodo.

Para obtener una referencia a un nodo relativo al actual, utilizamos el método `Node.get_node()`. Podemos almacenar la referencia en una variable.

```
func _ready():
	var timer = get_node("Timer")
```

La función `get_node()` observa los hijos del **Sprite2D** y obtiene los nodos por su nombre. Por ejemplo, si renombraste el nodo Timer a **BlinkingTimer** en el editor, tendrías que cambiar la llamada a `get_node("BlinkingTimer")`.

Ahora podemos conectar el Timer al **Sprite2D** en la función `_ready()`:

```
func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
```

La línea se lee así: conectamos la señal `timeout` del Timer al nodo al que está conectado el script (en este caso: Sprite2D). Cuando el Timer emite `timeout`, queremos llamar a la función `_on_timer_timeout()`, que necesitamos definir. Agreguémosla al final de nuestro script y usémosla para alternar la visibilidad de nuestro sprite.

> **Nota:** Por convención, nombramos estos métodos de devolución de llamada (callbacks) en GDScript como `_on_node_name_signal_name`. Aquí y para GDScript, será `_on_timer_timeout`.

```
func _on_timer_timeout():
	visible = not visible
```

La propiedad `visible` es un valor booleano que controla la visibilidad de nuestro nodo. La línea `visible = not visible` alterna el valor. Si `visible` es `true`, se convierte en `false` y viceversa.

Si ejecuta la escena `Node2D` ahora, verá que el sprite parpadea, en intervalos de un segundo.

#### Señales personalizadas

> **Nota:** Esta sección es una referencia sobre cómo definir y usar sus propias señales, y no se basa en el proyecto creado en lecciones anteriores.

Puede definir _señales personalizadas_ (custom signals) en un script. Digamos, por ejemplo, que desea mostrar una pantalla de fin de juego cuando la salud del jugador llegue a cero. Para ello, puede definir una señal denominada `died` o `health_depleted` cuando su salud llegue a `0`:

```
extends Node2D

signal health_depleted

var health = 10
```

> **Nota:** Como las señales representan eventos que acaban de ocurrir, generalmente usamos en sus nombres un verbo de acción en tiempo pasado.

Sus _señales personalizadas_ funcionan de la misma manera que las integradas: aparecen en la pestaña **Nodo** y puede conectarse a ellas como cualquier otra:

![click-script](img/signals_17_custom_signal.webp)

Para emitir una señal en sus scripts, llame a `emit()` en la señal.

```
func take_damage(amount):
	health -= amount
	if health <= 0:
		health_depleted.emit()
```

> **Nota:** Una señal puede declarar opcionalmente uno o más argumentos. Especifique los nombres de los argumentos entre paréntesis:

```
extends Node2D

signal health_changed(old_value, new_value)

var health = 10
```

> **Nota:** Los argumentos de la señal aparecen en el panel de nodos del editor, y Godot puede usarlos para generar funciones de devolución de llamada (callbacks) para usted. Sin embargo, aún puede emitir cualquier cantidad de argumentos cuando emite señales. Por lo tanto, depende de usted emitir los valores correctos.

Para emitir valores junto con la señal, agréguelos como argumentos adicionales a la función `emit()`:

```
func take_damage(amount):
	var old_health = health
	health -= amount
	health_changed.emit(old_health, health)
```

#### Resumen

En Godot cualquier nodo emite señales cuando algo específico le sucede, por ejemplo: presionar un botón. Otros nodos pueden conectarse a señales individuales y reaccionar a eventos seleccionados.

Las señales tienen muchos usos. Con ellas, puede reaccionar a un nodo que ingresa o sale del mundo del juego, a una colisión, a un personaje que ingresa o sale de un área, a un elemento de la interfaz que cambia de tamaño y mucho más.

Por ejemplo, un **Area2D** que representa una moneda emite una señal `body_entered` cada vez que el cuerpo físico del jugador ingresa en su forma de colisión, lo que le permite saber cuándo el jugador lo recogió.

En el siguiente capítulo, [Tu primer juego 2D](#tu-primer-juego-2d), crearás un juego 2D completo y pondrás en práctica todo lo que aprendiste hasta ahora.

## Capítulo 3. Tu primer juego 2D

En esta serie de tutoriales, crearás tu primer juego 2D completo con Godot. Al final de la serie, tendrás un juego simple pero completo propio, como la imagen de abajo:

![dodge-preview](img/dodge_preview.webp)

Aprenderás a partir de la práctica cómo funciona el editor Godot, cómo estructurar un proyecto y crear un juego 2D.

> **Nota:** Este proyecto es una introducción al motor Godot. Se supone que ya tienes algo de experiencia en programación. Si eres nuevo en programación, deberías comenzar aquí: [Lenguajes de programación](capitulo-2-primeros-pasos.md#lenguajes-de-programación).

El juego se llama _"Dodge the Creeps!"_. Tu personaje debe moverse y evitar a los enemigos durante el mayor tiempo posible.

Aprenderás a:

- Crear un juego 2D completo con el editor Godot.
- Estructurar un proyecto de juego simple.
- Mover al personaje del jugador y cambiar su sprite.
- Generar enemigos aleatorios.
- Contar la puntuación.

Y más.

Encontrarás otra serie en la que crearás un juego similar pero en 3D. Sin embargo, te recomendamos que comiences con este.

**¿Por qué comenzar con 2D?**

Si eres nuevo en el desarrollo de juegos o no estás familiarizado con Godot, te recomendamos comenzar con juegos 2D. Esto te permitirá sentirte cómodo con ambos antes de abordar los juegos 3D, que tienden a ser más complicados.

Puedes encontrar una versión completa de este proyecto en esta ubicación:

https://github.com/godotengine/godot-demo-projects/tree/master/2d/dodge_the_creeps

### Requisitos previos

Este tutorial paso a paso está destinado a principiantes que siguieron el tutorial completo de [Capítulo 2 - Primeros pasos](capitulo-2-primeros-pasos.md).

Si eres un programador experimentado, puedes encontrar el código fuente de la demostración completa aquí: [Código fuente de Dodge the Creeps](https://github.com/godotengine/godot-demo-projects/tree/master/2d/dodge_the_creeps).

Preparamos algunos recursos del juego que necesitarás descargar para que podamos pasar directamente al código.

Puedes descargarlos haciendo clic en el enlace a continuación.

[dodge_the_creeps_2d_assets.zip](./assets/2d/dodge_the_creeps_2d_assets.zip)

### Contenido

- Configuración del proyecto
- Creación de la escena del jugador
- Codificación del jugador
- Creación del enemigo
- La escena principal del juego
- Pantalla de visualización frontal
- Finalización

### Configuración del proyecto

En esta breve primera parte, configuraremos y organizaremos el proyecto.

Ejecuta Godot y crea un nuevo proyecto.

![new-project-button](img/new-project-button.webp)

Al crear el nuevo proyecto, solo necesitas elegir una _Project Path_ válida. Puedes dejar las otras configuraciones predeterminadas como están.

> **Nota:** Descarga [dodge_the_creeps_2d_assets.zip](./assets/2d/dodge_the_creeps_2d_assets.zip). El archivo contiene las imágenes y sonidos que usarás para crear el juego. Extrae el archivo y mueve los directorios `art/` y `fonts/` al directorio de tu proyecto.

La carpeta de tu proyecto debería verse así.

![folder-content](img/folder-content.webp)

Este juego está diseñado para el modo vertical, por lo que necesitamos ajustar el tamaño de la ventana del juego. Haz clic en _Project -> Project Settings_ para abrir la ventana de configuración del proyecto, en la columna de la izquierda abre la pestaña _Display -> Window_. Allí, configure **Size > Viewport Width** en `480` y **Size > Viewport Height** en `720`.

![setting-project-width-and-height](img/setting-project-width-and-height.webp)

Además, en las opciones de **Stretch**, configure **Mode > Stretch** en `canvas_items` y **Aspect** en `keep`. Esto garantiza que el juego se escale de manera uniforme en pantallas de diferentes tamaños. Luego de estos cambios clic en el botón _Close_.

![setting-stretch-mode](img/setting-stretch-mode.webp)

#### Organización del proyecto

En este proyecto, crearemos 3 escenas independientes: `Player`, `Mob` y `HUD`, que combinaremos en la escena `Main` del juego.

En un proyecto más grande, puede ser útil crear carpetas para almacenar las distintas escenas y sus scripts, pero para este juego relativamente pequeño, puede guardar sus escenas y scripts en la carpeta raíz del proyecto, identificada por `res://`. Puedes ver las carpetas de tu proyecto en el dock _FileSystem_ en la esquina inferior izquierda:

![filesystem-dock](img/filesystem_dock.webp)

Con el proyecto en marcha, estamos listos para diseñar la escena del jugador en la próxima lección.

### Creación de la escena del jugador

Una vez que hayamos configurado el proyecto, podemos empezar a trabajar en el personaje controlado por el jugador.

La primera escena definirá el objeto `Player`. Uno de los beneficios de crear una escena Jugador independiente es que podemos probarla por separado, incluso antes de haber creado otras partes del juego.

#### Estructura de nodos

Para comenzar, debemos elegir un nodo raíz para el objeto `Player`. Como regla general, el nodo raíz de una escena debe reflejar la **funcionalidad** deseada del objeto: qué _es_ el objeto. Haga clic en el botón **Other Node** y agregue un nodo `Area2D` a la escena.

../../_images/add_node.webp

Cuando agregue el nodo `Area2D`, Godot mostrará el siguiente _ícono de advertencia_ junto a él en el árbol de la escena:

![no-shape-warning](img/no_shape_warning.webp)

Esta advertencia nos indica que el nodo `Area2D` requiere una _shape_ (forma) para detectar colisiones o superposiciones. Podemos **ignorar la advertencia temporalmente** porque primero configuraremos los elementos visuales del jugador (usando un sprite animado). Una vez que los elementos visuales estén listos, agregaremos una _collision shape_ (forma de colisión) como un nodo hijo. Esto nos permitirá dimensionar y posicionar con precisión la forma en función de la apariencia del sprite.

Con `Area2D` podemos detectar objetos que se superponen o chocan con el jugador. Cambie el nombre del nodo a `Player` haciendo doble clic en él. Ahora que hemos configurado el nodo raíz de la escena, podemos agregar nodos adicionales para darle más funcionalidad.

Antes de agregar cualquier elemento hijo al nodo `Player`, queremos asegurarnos de no moverlos o cambiar su tamaño accidentalmente al hacer clic en ellos. Seleccione el nodo y haga clic en el ícono a la derecha del candado. Su información sobre herramientas dice `Group Selected Node(s) (Ctrl + G)`. Esto hace que se seleccione el elemento principal cuando se hace clic en cualquier nodo secundario en la vista 2D y 3D.

![lock-children](img/lock_children.webp)

Guarde la escena. Haz clic en `Scene > Save`, o presiona `Ctrl + S` en Windows/Linux o `Cmd + S` en macOS. Guardar la escena como `Player.tscn`.

> **Nota:** Para este proyecto, seguiremos las convenciones de nomenclatura de Godot.
>
> **GDScript:** las clases (nodos) usan `PascalCase`, las variables y funciones usan `snake_case` y las constantes usan `ALL_CAPS` (Consulta la [guía de estilo de GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#doc-gdscript-styleguide)).
>
> **C#:** las clases, las variables de exportación y los métodos usan `PascalCase`, los campos privados usan `_camelCase`, las variables locales y los parámetros usan `camelCase` (Consulta la [guía de estilo de C#](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/c_sharp_style_guide.html#doc-c-sharp-styleguide)).

#### Animación de sprites

Haz clic en el nodo `Player` y agrega (`Ctrl + A` en Windows/Linux o `Cmd + A` en macOS) un nodo hijo **AnimatedSprite2D**. _AnimatedSprite2D_ se encargará de la apariencia y las animaciones de nuestro nodo `Player`. Observa que hay un símbolo de advertencia junto al nodo. Un _AnimatedSprite2D_ requiere un recurso **SpriteFrames**, que es una lista de las animaciones que puede mostrar. Para crear uno, busque la propiedad `Sprite Frames` en la pestaña `Animation` del `Inspector` y haga clic en `[empty] > New SpriteFrames`:

![new-spriteframes](img/new_spriteframes.webp)

Haga clic en el campo `SpriteFrames` que acaba de crear para abrir el panel **SpriteFrames**:

![spriteframes-panel](img/spriteframes_panel.webp)

A la izquierda hay una lista de animaciones. Haga clic en la `default` y cámbiele el nombre a `walk`. Luego, haga clic en el botón **Add Animation** para crear una segunda animación llamada `up`. Busque las imágenes del jugador en la pestaña **FileSystem**; están en la carpeta `art` dentro de la carpeta `res` que descomprimió anteriormente. Arrastre las dos imágenes para cada animación, llamadas `playerGrey_walk[1/2]` y `playerGrey_walk[2/2]`, hacia el lado **Animation Frame** del panel para la animación correspondiente. Haga lo mismo con `up` llamando a `playerGrey_up[1/2]` y `playerGrey_up[2/2]`:

![spriteframes-panel2](img/spriteframes_panel2.webp)

Las imágenes del jugador son un poco  grandes para la ventana del juego, por lo que debemos reducir su tamaño. Haga clic en el nodo `AnimatedSprite2D` y configure la propiedad `Scale` en `(0.5, 0.5)`. Puede encontrarla en el **Inspector** bajo el encabezado **Node2D > Transform**.

![player-scale](img/player_scale.webp)

Por último, agregue un `CollisionShape2D` como nodo hijo de `Player`. Esto determinará el _hitbox_ del jugador, o los límites de su área de colisión. Para este personaje, un nodo `CapsuleShape2D` brinda el mejor ajuste, por lo que junto a `Shape` en el **Inspector**, haga clic en `[empty] > New CapsuleShape2D`. Utilizando los dos controladores de tamaño, cambia el tamaño de la forma para cubrir el sprite:

![player-coll-shape](img/player_coll_shape.webp)

Cuando hayas terminado, tu escena del jugador debería verse así:

![player-scene-nodes](img/player_scene_nodes.webp)

Una vez hecho esto, la advertencia en el nodo **Area2D** desaparecerá, ya que ahora tiene una forma asignada y puede interactuar con otros objetos.

Asegúrate de guardar la escena nuevamente después de estos cambios.

En la siguiente parte, agregaremos un **script** al nodo del jugador para moverlo y animarlo. Luego, configuraremos la detección de colisiones para saber cuándo el jugador fue golpeado por algo.

### Código del jugador

En esta lección, agregaremos movimiento y animación al jugador y lo configuraremos para detectar colisiones.

Para ello, necesitamos agregar alguna funcionalidad que no podemos obtener de un nodo integrado, por lo que agregaremos un script. Haga clic en el nodo `Player` y luego en el botón `Attach a new or existing script to the selected node`:

![add-script-button](img/add_script_button.webp)

En la ventana de configuración del script, puede dejar la configuración predeterminada como está. Simplemente haga clic en el botón `Create`:

> **Nota:** Si está creando un script en C# u otros lenguajes, seleccionelo en el menú desplegable **Language** antes de hacer clic en `Create`.

![attach-node-window](img/attach_node_window.webp)

> **Nota:** Si es la primera vez que se encuentra con GDScript, lea [Lenguajes de programación](capitulo-2-primeros-pasos.md#lenguajes-de-programación) antes de continuar.

Comience por declarar las _variables miembro_ que necesitará este objeto:

```
extends Area2D

@export var speed = 400 # La velocidad en la que el jugador se moverá (píxeles/segundo).
var screen_size # Tamaño de la ventana del juego.
```

El uso de la _palabra clave_ `export` en la primera variable `speed` nos permite establecer su valor en el **Inspector**. Esto puede ser útil para valores que desea poder ajustar al igual que las propiedades integradas de un nodo. Haga clic en el nodo `Player` y verá que la propiedad ahora aparece en el **Inspector** en una nueva sección con el nombre del script. Recuerde, si cambia el valor aquí, anulará el valor escrito en el script.


> **Advertencia:** Si está usando C#, debe (re)compilar los ensambles del proyecto cada vez que desee ver nuevas variables o señales de exportación. Esta compilación se puede activar manualmente haciendo clic en el botón `Build` (compilar) en la parte superior derecha del editor.
>
> ![build-dotnet](img/build_dotnet.webp)

![export-variable](img/export_variable.webp)

Tu ​​script `player.gd` ya debería contener una función `_ready()` y una función `_process()`. Si no seleccionaste la _plantilla predeterminada_ que se muestra arriba, crea estas funciones mientras sigues la lección.

La función `_ready()` se llama cuando un nodo ingresa al árbol de escena, que es un buen momento para encontrar el tamaño de la ventana del juego:

```
func _ready():
	screen_size = get_viewport_rect().size
```

Ahora podemos usar la función `_process()` para definir lo que hará el jugador. 

La función `_process()` se llama en cada cuadro, por lo que la usaremos para actualizar elementos de nuestro juego, que esperamos que cambien a menudo. Para el jugador, necesitamos hacer lo siguiente:

- Verificar el input.
- Moverse en la dirección dada.
- Reproducir la animación apropiada.

Primero, necesitamos verificar el input: ¿el jugador está presionando una tecla? Para este juego, tenemos para verificar 4 entradas de dirección. Las _input actions_ (acciones de entrada) se definen en **Project Settings > Input Map**. Aquí, puedes definir _custom events_ (eventos personalizados) y asignarles diferentes teclas, eventos del mouse u otras entradas. Para este juego, asignaremos las teclas de flecha a las cuatro direcciones.

Haz clic en **Project Settings> Project Settings** para abrir la ventana de configuración del proyecto y haz clic en la pestaña **Input Map** en la parte superior. Escribe `move_right` en la barra superior cuyo placeholder dice **Add New Action** y haz clic en el botón **Add Action** para agregar la acción `move_right`.

![input-mapping-add-action](img/input-mapping-add-action.webp)

Necesitamos asignar una tecla a esta acción. Haz clic en el ícono `+` a la derecha para abrir la ventana _Configuración de Eventos_:

![input-mapping-add-key](img/input-mapping-add-key.webp)

El campo `Listening for Input` debería seleccionarse automáticamente. Presiona la tecla `right` en tu teclado y el menú debería verse así ahora:

![input-mapping-event-configuration](img/input-mapping-event-configuration.webp)

Seleccione el botón **OK**. La tecla `right` ahora está asociada con la acción `move_right`.

Repita estos pasos para agregar tres asignaciones más:

- `move_left` está asignada a la tecla de **flecha izquierda**.
- `move_up` está asignada a la tecla de **flecha arriba**.
- Y `move_down` está asignada a la tecla de **flecha abajo**.

La pestaña de asignación de entrada debería verse así:

![input-mapping-completed](img/input-mapping-completed.webp)

Haga clic en el botón **Close** para cerrar la configuración del proyecto.

> **Nota:** Solo asignamos una tecla a cada acción de entrada, pero puede asignar varias teclas, botones del joystick o botones del mouse a la misma acción de entrada.

Puede detectar si se presiona una tecla usando `Input.is_action_pressed()`, que devuelve `true` si está presionada o `false` si no lo está.

```
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
```

Comenzamos estableciendo `velocity` en `(0, 0)`: de manera predeterminada, el jugador no debería estar moviéndose. Luego verificamos cada input y sumamos/restamos de `velocity` para obtener una dirección total. Por ejemplo, si mantienes presionados las teclas **right** y **down** al mismo tiempo, el vector de velocidad resultante será (1, 1). En este caso, dado que estamos sumando un movimiento horizontal y uno vertical, el jugador se movería más rápido en diagonal que si solo se moviera horizontalmente.

Podemos evitarlo si _normalizamos_ la velocidad, lo que significa que establecemos su _longitud_ en `1` y luego multiplicamos por la velocidad deseada. Esto significa que no habrá más movimientos diagonales rápidos.

> **Consejo:** Si nunca antes usaste matemáticas vectoriales o necesitas un repaso, puedes ver una explicación del uso de vectores en Godot en [Vector Math](https://docs.godotengine.org/en/stable/tutorials/math/vector_math.html#doc-vector-math). Es bueno saberlo, pero no será necesario para el resto de este tutorial.

También verificamos si el jugador se está moviendo para poder llamar a _play()_ o _stop()_ en **AnimatedSprite2D**.

> **Sugerencia:** `$` es la abreviatura de `get_node()`. Por lo tanto en el código anterior, `$AnimatedSprite2D.play()` es la forma abreviada de `get_node("AnimatedSprite2D").play()`.
>
> En GDScript, `$` devuelve el _nodo en la ruta relativa desde el nodo actual_, o devuelve `null` si no se encuentra el nodo. Dado que **AnimatedSprite2D** es un nodo hijo del nodo actual, podemos usar `$AnimatedSprite2D`.

Ahora que tenemos una dirección de movimiento, podemos actualizar la posición del jugador. También podemos usar `clamp()` para evitar que abandone la pantalla. **Fijar** un valor (clamping a value) significa restringirlo a un rango determinado. Agregue lo siguiente al final de la función `_process` (asegúrese de que no esté sangrado debajo del `else`):

```
position += velocity * delta
position = position.clamp(Vector2.ZERO, screen_size)
```

> **Sugerencia:** El parámetro _delta_ en la función `_process()` se refiere a la _longitud del cuadro_: es decir, la cantidad de tiempo que tardó en completarse el cuadro anterior. El uso de este valor garantiza que el movimiento se mantendrá constante incluso si cambia la velocidad de cuadros.

Haga clic en **Run Current Scene** (`F6`, `Cmd + R` en macOS) y confirme que puede mover el jugador por la pantalla en todas las direcciones.

> **Advertencia:** Si recibe un error en el panel **Debugger** que dice:
>
> `Attempt to call function 'play' in base 'null instance' on a null instance`
>
> es probable que esto signifique que escribió mal el nombre del nodo **AnimatedSprite2D**. Los nombres de los nodos distinguen entre mayúsculas y minúsculas y **$NodeName** debe coincidir con el nombre que ve en el árbol de la escena.

#### Elección de animaciones

Ahora que el jugador puede moverse, debemos cambiar la animación que reproduce **AnimatedSprite2D** en función de su dirección. Tenemos la animación **walk**, que muestra al reproductor caminando hacia la derecha. Esta animación debe voltearse horizontalmente usando la propiedad `flip_h` para el movimiento hacia la izquierda. También tenemos la animación "arriba", que debe voltearse verticalmente con `flip_v` para el movimiento hacia abajo. Coloquemos este código al final de la función `_process()`:

```
if velocity.x != 0:
	$AnimatedSprite2D.animation = "walk"
	$AnimatedSprite2D.flip_v = false
	# Vea la nota a continuación sobre la siguiente asignación booleana.
	$AnimatedSprite2D.flip_h = velocity.x < 0
elif velocity.y != 0:
	$AnimatedSprite2D.animation = "up"
	$AnimatedSprite2D.flip_v = velocity.y > 0
```

> **Nota:** Las asignaciones booleanas (boolean assignments) en el código anterior son una abreviatura común para los programadores. Dado que estamos haciendo una prueba de comparación (booleana) y también _asignando_ un valor booleano, podemos hacer ambas cosas al mismo tiempo. Considere este código en comparación con la _asignación booleana_ de una línea anterior:
>
>```
> if velocity.x < 0:
>	$AnimatedSprite2D.flip_h = true
>else:
>	$AnimatedSprite2D.flip_h = false
>```

Reproduzca la escena nuevamente y verifique que las animaciones sean correctas en cada una de las direcciones.

> **Sugerencia:** Un error común aquí es escribir mal los nombres de las animaciones. Los nombres de las animaciones en el panel **SpriteFrames** deben coincidir con lo que escribe en el código. Si nombró la animación `Walk`, también debe usar una `W` mayúscula en el código.

Cuando esté seguro de que el movimiento funciona correctamente, agregue esta línea a `_ready()`, para que el jugador esté oculto cuando comience el juego:

```
hide()
```

#### Preparación para colisiones

Queremos que el jugador detecte cuando es golpeado por un enemigo, ¡pero aún no hemos creado ningún enemigo! Eso está bien, porque vamos a usar _señales_ para que funcione.

Agrega lo siguiente en la parte superior del script. Si estás usando GDScript, agrégalo después de `extends Area2D`. Si estás usando C#, agrégalo después de `public partial class Player : Area2D`:

```
signal hit
```

Esto define una _señal personalizada_ llamada `hit` que nuestro jugador emitirá (enviará) cada vez que colisione con un enemigo. Usaremos **Area2D** para detectar la colisión. Selecciona el nodo `Player` y haz clic en la pestaña "Node" junto a la pestaña Inspector para ver la lista de señales que el jugador puede emitir:

![player-signals](img/player_signals.webp)

¡Observa que nuestra señal `hit` personalizada también está allí! Dado que nuestros enemigos serán nodos **RigidBody2D**, entonces seleccionamos la señal `body_entered(body: Node2D)`. Esta señal se emitirá cuando un cuerpo entre en contacto con el jugador. Luego haz clic en **Connect...** y aparecerá la ventana **Connect a Signal to a Method**.

Godot creará una función con ese nombre exacto directamente en el script para ti. No es necesario cambiar la configuración predeterminada. Por último haz clic en el botón **Connect**.

> **Advertencia:** Si estás usando un editor de texto externo (por ejemplo, **Visual Studio Code**), un error impide que Godot lo haga. Serás enviado a tu editor externo, pero la nueva función no estará allí.
>
> En este caso, tendrás que escribir la función tú mismo en el archivo de script del jugador.

![player-signal-connection](img/player_signal_connection.webp)

Observa el _icono verde_ que indica que una señal está conectada a esta función; esto no significa que la función exista, solo que la señal intentará conectarse a una función con ese nombre, así que comprueba que la ortografía de la función coincida exactamente.

A continuación, agrega este código a la función:

```
func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Debe posponerse ya que no podemos cambiar las propiedades físicas en una devolución de llamada de física.
	$CollisionShape2D.set_deferred("disabled", true)
```

Cada vez que un enemigo golpea al jugador, se emitirá la señal. Necesitamos desactivar la colisión del jugador para no activar la señal de impacto más de una vez.

> **Nota:** Desactivar la forma de colisión del área puede causar un error si sucede en medio del procesamiento de colisión del motor. El uso de `set_deferred()` le indica a Godot que espere para desactivar la forma hasta que sea seguro hacerlo.

La última parte es agregar una función que podemos llamar para restablecer el jugador al comenzar un nuevo juego.

```
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
```

Con el jugador ya funcionando, en la siguiente lección trabajaremos en el enemigo.

### Creando al enemigo

Ahora es el momento de crear a los **mobs** (mobile, equivalente a _hostile NPC_ (Hostile Non-Playable Character)) que nuestro jugador tendrá que esquivar. Su comportamiento no será muy complejo: los _mobs_ aparecerán aleatoriamente en los bordes de la pantalla, elegirán una dirección aleatoria y se moverán en línea recta.

Crearemos una escena `Mob`, que luego podremos _instanciar_ para crear cualquier cantidad de mobs independientes en el juego.

#### Configuración de nodos

Haz clic en `Scene > New Scene` en el menú superior y agrega los siguientes nodos:

- RigidBody2D (renombrar como `Mob`)
    - AnimatedSprite2D
    - CollisionShape2D
    - VisibleOnScreenNotifier2D

No olvides configurar los nodos hijos para que no se puedan seleccionar, como hiciste con la escena `Player`.

Selecciona el nodo `Mob` y establece su propiedad `Gravity Scale` en la sección **RigidBody2D** del **Inspector** en `0`. Esto evitará que el _mob_ caiga hacia abajo (neutralizamos la gravedad).

Además, en la sección **CollisionObject2D**, justo debajo de la sección **RigidBody2D**, expande el grupo `Collision` y desmarca el `1` correspondiente a la propiedad `Mask`. Esto garantizará que los _mobs_ no colisionen entre sí.

![set-collision-mask](img/set_collision_mask.webp)

Configura **AnimatedSprite2D** como lo hiciste para el jugador. Esta vez, tenemos 3 animaciones: `fly`, `swim` y `walk`. Hay dos imágenes para cada animación en la carpeta `art`:

> - `AnimatedSprite2D` > Inspector > AnimatedSprite2D > Animation > Sprite Frame > New SpriteFrames > `fly`, `swim` y `walk`

La propiedad **Animation Speed** ​​debe configurarse para cada animación individual. Ajústala a `3` para las 3 animaciones.

![mob_animations](img/mob_animations.webp)

Puedes usar los botones **Play Animation** a la derecha del campo de entrada **Animation Speed** ​​para obtener una vista previa de tus animaciones.

Seleccionaremos una de estas animaciones al azar para que los _mobs_ tengan algo de variedad.

Al igual que las imágenes del jugador, estas imágenes de _mobs_ deben reducirse. Establezca la propiedad **Scale** de **AnimatedSprite2D** en `(0.75, 0.75)`.

Al igual que en la escena `Player`, agregue un `CapsuleShape2D` para la colisión. Para alinear la forma con la imagen, deberá establecer la propiedad **Position** en `X: 12` (en **Transform** en el **Inspector**).

Guarde la escena.

#### Script del enemigo

Agregue un script a `Mob` y verá la base del script como el siguiente:

```
extends RigidBody2D
```

Ahora veamos el resto del script. En `_ready()` reproducimos la animación y elegimos aleatoriamente uno de los 3 tipos de animación:

```
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
```

Primero, obtenemos la lista de nombres de animación de la propiedad **sprite_frames** de **AnimatedSprite2D**. Esto devuelve una matriz que contiene los tres nombres de animación: `["walk", "swim", "fly"]`.

Luego debemos elegir un número aleatorio entre `0` y `2` para seleccionar uno de estos nombres de la lista (los índices de la matriz comienzan en 0). `randi() % n` selecciona un entero aleatorio entre `0` y `n-1`.

Ahora, la última parte es hacer que los _mobs_ se borren a sí mismos cuando abandonan la pantalla. Conecta la señal `screen_exited()` del nodo **VisibleOnScreenNotifier2D** al `Mob` y agrega este código:

```
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
```

Esto completa la escena `Mob`.

Con el jugador y los enemigos listos, en la siguiente parte los reuniremos en una nueva escena. Haremos que los enemigos aparezcan aleatoriamente alrededor del tablero de juego y avanzaremos, convirtiendo nuestro proyecto en un juego jugable.

### La escena `Main` del juego

Ahora es momento de reunir todo lo que hicimos en una escena de juego jugable.

Cree una nueva escena y agregue un `Node`o llamelo `Main`. (La razón por la que usamos **Node** en lugar de **Node2D** es porque este nodo será un contenedor para manejar la lógica del juego. No requiere funcionalidad 2D en sí mismo).

Haga clic en el botón **Instantiate Child Scene...** (Ctrl + Shift + A) (representado por un ícono de enlace de cadena) y seleccione su `Player.tscn` guardado.

![instance-scene](img/instance_scene.webp)

Ahora, agrega los siguientes nodos como hijos de `Main` y nómbralos como se muestra:

- **Timer** (renómbrelo `MobTimer`): para controlar la frecuencia con la que aparecen los _mobs_.
- **Timer** (renómbrelo `ScoreTimer`): para incrementar el puntaje cada segundo.
- **Timer** (renómbrelo `StartTimer`): para dar un retraso antes de comenzar.
- **Marker2D** (renómbrelo `StartPosition`): para indicar la posición inicial del jugador.

Establece la propiedad `Wait Time` de cada uno de los nodos **Timer** de la siguiente manera (los valores están en segundos):

- **MobTimer**: `0.5`
- **ScoreTimer**: `1`
- **StartTimer**: `2`

Además, para el nodo **StartTimer** establece la propiedad `One Shot` en `On` y para el nodo **StartPosition** la propiedad `Position` en `(240, 450)`.

#### Generación de mobs

El nodo `Main` generará nuevos _mobs_ y aparecerán en una ubicación aleatoria en el borde de la pantalla. Agrega un nodo **Path2D** (renómbrelo `MobPath`) como hijo de `Main`. Cuando selecciones **Path2D**, verás algunos botones nuevos en la parte superior del editor:

![path2d-buttons](img/path2d_buttons.webp)

Selecciona el del medio (**Add Point**) y dibuja la ruta haciendo clic para agregar los puntos en las esquinas que se muestran. Para que los puntos se ajusten a la cuadrícula, asegúrate de que **Use Grid Snap** y **Use Smart Snap** estén seleccionados. Estas opciones se pueden encontrar a la izquierda del botón **Lock**, y aparecen como un imán junto a algunos puntos y líneas que se cruzan, respectivamente.

![grid-snap-button](img/grid_snap_button.webp)

> **Importante:**
>
>¡Dibuja la ruta en el sentido de las agujas del reloj o tus _mobs_ aparecerán apuntando hacia afuera en lugar de hacia adentro!

![draw-path2d](img/draw_path2d.gif)

Después de colocar el punto `4` en la imagen, haz clic en el botón **Close Curve** y tu curva estará completa.

![finished-path](img/finished-path.png)

Ahora que la ruta está definida, agrega un nodo **PathFollow2D** como hijo de **MobPath** y nómbralo `MobSpawnLocation`. Este nodo rotará automáticamente y seguirá la ruta a medida que se mueve, por lo que podemos usarlo para seleccionar una posición y dirección aleatorias a lo largo de la ruta.

Tu escena debería verse así:

![main-scene-nodes](img/main_scene_nodes.webp)

#### Script principal

Agrega un script a `Main`. En la parte superior del script, usamos `@export var mob_scene: PackedScene` para permitirnos elegir la escena **Mob** que queremos instanciar.

```
extends Node

@export var mob_scene: PackedScene
var score
```

Haz clic en el nodo `Main` y verás la propiedad **Mob Scene** en el **Inspector** bajo `main.gd`.

Puedes asignar el valor de esta propiedad de dos maneras:

- Arrastra `Mob.tscn` desde el dock **FileSystem** y suéltalo en la propiedad **Mob Scene**.
- Haz clic en la flecha hacia abajo junto a `[empty]` y elige **Load**. Selecciona `Mob.tscn`.

A continuación, selecciona la instancia de la escena **Player** en el nodo `Main` en el dock **Scene** y accede al dock **Node** en la barra lateral derecha. Asegúrate de tener la pestaña **Signals** seleccionada en el dock **Node**.

Deberías ver una lista de las señales para el nodo `Player`. Busque y haga doble clic en la señal de `hit` en la lista (o haga clic derecho en ella y seleccione **Connect...**). Esto abrirá el cuadro de diálogo de conexión de la señal. Queremos crear una nueva función llamada `game_over`, que se encargará de lo que debe suceder cuando finaliza un juego. Escriba `game_over` en el cuadro **Receiver Method** en la parte inferior del cuadro de diálogo de conexión de la señal y haga clic en el botón **Connect**. El objetivo es que la señal `hit` se emita desde `Player` y se gestione en el script de `Main`. Agregue el siguiente código a la nueva función, así como una función _new_game_ que configurará todo para un nuevo juego:

```
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
```

Ahora conecte la señal `timeout()` de cada uno de los nodos **Timer** (`StartTimer`, `ScoreTimer` y `MobTimer`) al script `Main`. `StartTimer` iniciará los otros dos temporizadores. `ScoreTimer` incrementará la puntuación en `1`.

```
func _on_score_timer_timeout():
	score += 1

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
```

En `_on_mob_timer_timeout()`, crearemos una instancia `Mob`, elegiremos una ubicación de inicio aleatoria a lo largo de **Path2D** y pondremos al _mob_ en movimiento. El nodo **PathFollow2D** rotará automáticamente a medida que sigue el camino, por lo que lo usaremos para seleccionar la dirección del monstruo y su posición. Cuando generemos un _mob_, elegiremos un valor aleatorio entre `150.0` y `250.0` para la velocidad a la que se moverá cada _mob_ (sería aburrido si todos se movieran a la misma velocidad).

Tenga en cuenta que se debe agregar una nueva instancia a la escena usando `add_child()`.

```
func _on_mob_timer_timeout():
	# Crea una nueva instancia de la escena Mob.
	var mob = mob_scene.instantiate()

	# Elige una ubicación aleatoria en Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Establece la dirección del mob perpendicular a la dirección del Path.
	var direction = mob_spawn_location.rotation + PI / 2

	# Establece la posición del mob en una ubicación aleatoria.
	mob.position = mob_spawn_location.position

	# Agrega algo de aleatoriedad a la dirección.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Elige la velocidad del mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Genera el mob agregándolo a la escena Main.
	add_child(mob)
```

> **Importante:**
>
>¿Por qué `PI`? En las funciones que requieren ángulos, Godot usa _radianes_, no grados. **Pi** representa media vuelta en radianes, aproximadamente `3,1415` (también existe `TAU` que es igual a `2 * PI`). Si te sientes más cómodo trabajando con grados, necesitarás usar las funciones `deg_to_rad()` y `rad_to_deg()` para convertir entre los dos.

#### Probando la escena

Probemos la escena para asegurarnos de que todo esté funcionando. Agrega esta llamada `new_game` a `_ready()`:

```
func _ready():
	new_game()
```

Guardemos la escena como: `Main.tscn`

También asignemos `Main` como nuestra **Main Scene**, la que se ejecuta automáticamente cuando se inicia el juego. 


Presiona el botón **Run Project** y selecciona `Main.tscn` como escena principal cuando se te solicite.

> Otra variante para configurar la escena principal: Project > Project settings > General > Application > Run > `Main Scene:Main.tscn`

> **Consejo:**
>
> Si ya habías configurado otra escena como la **Main Scene**, puedes hacer clic derecho en `Main.tscn` en el dock del **FileSystem** y seleccionar la opción `Set As Main Scene`.

Deberías poder mover a _Player_, ver cómo aparecen los _mobs_ y ver cómo desaparece _Player_ cuando un _mob_ lo golpea.

Cuando estés seguro de que todo funciona, elimina la llamada a `new_game()` de `_ready()` y reemplázala con `pass`.

¿Qué le falta a nuestro juego? Un poco de _interfaz de usuario_. En la próxima lección, agregaremos una _pantalla de título_ y mostraremos el _puntaje del jugador_.

### Pantalla de visualización frontal (HUD, heads-up display)

La última pieza que necesita nuestro juego es una _interfaz de usuario (IU)_ para mostrar elementos como la puntuación, un mensaje de "game over" y un botón de reinicio.

Cree una nueva escena, haga clic en el botón **Other Node** y agregue un nodo **CanvasLayer** llamado `HUD`. "HUD" significa "pantalla de visualización frontal", una pantalla informativa que aparece como una superposición sobre la vista del juego.

El nodo **CanvasLayer** nos permite dibujar nuestros elementos de IU en una capa sobre el resto del juego, de modo que la información que muestra no esté cubierta por ningún elemento del juego, como el jugador o los monstruos.

El HUD debe mostrar la siguiente información:

- _Puntuación_, modificada por `ScoreTimer`.
- Un _mensaje_, como "Game Over" o "Get Ready!"
- Un _botón_ "Start" para comenzar el juego.

El nodo básico para los elementos de IU es **Control**. Para crear nuestra IU, usaremos dos tipos de nodos de _Control_: **Label** y **Button**.

Crea los siguientes nodos hijo de `HUD`:

- **Label** denominada `ScoreLabel`.
- **Label** denominada `Message`.
- **Button** denominado `StartButton`.
- **Timer** denominado `MessageTimer`.

Haz clic en **ScoreLabel** y escribe el número `0` en el campo `Text` del **Inspector**. La fuente predeterminada para los nodos **Control** es pequeña y no se escala bien. Hay un archivo de fuente incluido en los recursos del juego llamado `Xolonium-Regular.ttf`. Para usar esta fuente, haz lo siguiente:

En `ScoreLabel > Control > Theme Overrides > Fonts`, elige **Load** y selecciona el archivo `Xolonium-Regular.ttf`.

![custom-font-load-font](img/custom_font_load_font.webp)

El tamaño de fuente sigue siendo demasiado pequeño, auméntalo a `64` en `ScoreLabel > Control > Theme Overrides > Font Sizes`. Una vez que hayas hecho esto con **ScoreLabel**, repite los cambios para los nodos **Message** y **StartButton**.

![custom-font-size](img/custom_font_size.webp)

> **Nota:** 
>
> **Anclajes:** los nodos `Control` tienen una posición y un tamaño, pero también tienen anclajes. Los anclajes definen el origen, el punto de referencia para los bordes del nodo.

Organice los nodos como se muestra a continuación:

#### ScoreLabel

1. Agrega a **Label > Text** el valor `0`.
2. Establece en **Label > Horizontal Alignment** y **Label > Vertical Alignment** el valor `Center`.
3. Elige en **Control > Layout > Anchors Preset** el valor `Center Top`.

![ui-anchor](img/ui_anchor.webp)

Puede arrastrar los nodos para colocarlos manualmente o, para una colocación más precisa, utilice **Anchor Presets**.

#### Message

1. Agrega a **Label > Text** el valor `Dodge the creeps!`.
2. Establece en **Label > Horizontal Alignment** y **Label > Vertical Alignment** el valor `Center`.
3. Establece **Label > Autowrap Mode** en `Word`; de lo contrario, la etiqueta permanecerá en una línea.
4. En **Control > Layout > Transform > Size > X**, establece `480` para utilizar todo el ancho de la pantalla.
5. Elige en **Control > Layout > Anchors Preset** el valor `Center`.

#### StartButton

1. Agrega a **Label > Text** el valor `Start`.
2. En **Control > Layout > Transform > Size > X**, establece `200` y **Control > Layout > Transform > Size > X**, establece `100`  para agregar un poco más de relleno entre el borde y el texto.
3. Elige en **Control > Layout > Anchors Preset** el valor `Center Bottom`.
4. En **Control > Layout > Transform > Size > Position Y**, establece `580`.

En `MessageTimer`, configure **Timer > Wait Time** en `2` y configure la propiedad **Timer > One Shot** en "On".

Ahora agregue este script al nodo `HUD`:

```
extends CanvasLayer

# Notifica al nodo `Main` que se presionó el botón
signal start_game
```

Ahora queremos mostrar un mensaje temporalmente, como `Get Ready`, por lo que agregamos el siguiente código:

```
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
```

También necesitamos procesar lo que sucede cuando el jugador pierde. El código a continuación mostrará `Game Over` durante 2 segundos, luego volverá a la pantalla de título y, después de una breve pausa, mostrará el botón **Start**.

```
func show_game_over():
	show_message("Game Over")
	# Espere hasta que MessageTimer haya contado regresivamente.
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	# Crea un temporizador de un solo uso y espera a que termine.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
```

Esta función se llama cuando el jugador pierde. Mostrará `Game Over` durante 2 segundos, luego volverá a la pantalla de título y, después de una breve pausa, mostrará el botón `Start`.

> **Nota:** Cuando necesitas hacer una pausa por un breve tiempo, una alternativa al uso de un nodo **Timer** es usar la función `create_timer()` de **SceneTree**. Esto puede ser muy útil para agregar demoras como en el código anterior, donde queremos esperar un tiempo antes de mostrar el botón **Start**.

Agregue el código a continuación al nodo `HUD` para actualizar la puntuación:

```
func update_score(score):
	$ScoreLabel.text = str(score)
```

Conecte la señal `pressed()` de **StartButton** y la señal `timeout()` de **MessageTimer** al nodo `HUD` y agregue el siguiente código a las nuevas funciones:

```
func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
```

#### Conectar el HUD al nodo principal

Ahora que hemos terminado de crear la escena `HUD`, vuelve al nodo `Main`. Crea una instancia de la escena del `HUD` en el nodo `Main` como lo hiciste con la escena `Player`. El árbol de la escena debería verse así, así que asegúrate de no olvidarte de nada:

![completed-main-scene](img/completed_main_scene.webp)

Ahora necesitamos conectar la funcionalidad de `HUD` a nuestro script `Main`. Esto requiere algunas adiciones a la escena `Main`:

Selecciona la escena hija `Hud` de `Main` y elige en la pestaña **Node** del Inspector, conecta la señal `start_game` de **HUD** a la función `new_game()` del nodo `Main` haciendo clic en el botón **Pick a method** en la ventana **Connect a Signal** y seleccionando el método `new_game()` o escribe `new_game` debajo de **Receiver Method** en la ventana. Verifica que el ícono de conexión verde ahora aparezca junto a `func new_game()` en el script.

En `new_game()`, actualiza la visualización de la puntuación y muestra el mensaje `Get Ready`:

```
$HUD.update_score(score)
$HUD.show_message("Get Ready")
```

En `game_over()`, debemos llamar a la función `HUD` correspondiente:

```
$HUD.show_game_over()
```

Por último, agrega esto a `_on_score_timer_timeout()` para mantener la visualización sincronizada con el cambio de puntuación:

```
$HUD.update_score(score)
```

> **Advertencia:**
>
> Recuerda eliminar la llamada a `new_game()` de `_ready()` si aún no lo has hecho, de lo contrario, tu juego comenzará automáticamente.

¡Ahora estás listo para jugar! Haz clic en el botón **Play the Project**.

#### Eliminación de los creeps antiguos

Si juegas hasta **Game Over** y luego comienzas un nuevo juego de inmediato, los creeps del juego anterior pueden seguir en la pantalla. Sería mejor si todos desaparecieran al comienzo de un nuevo juego. Solo necesitamos una forma de decirle a todos los _mobs_ que se retiren. Podemos hacerlo con la funcionalidad **group**.

En la escena `Mob`, selecciona el nodo raíz y haz clic en la pestaña **Nodo** junto al **Inspector** (el mismo lugar donde se encuentran las señales del nodo). Junto a **Señales**, haz clic en **Groups** para abrir la descripción general del grupo y en el botón `+` para abrir el cuadro de diálogo **Create New Group**.

![group-tab](img/group_tab.webp)

Nombra el grupo `mobs` y haz clic en **Ok** para agregar un nuevo grupo de escena.

![add-group-dialog](img/add_group_dialog.webp)

Ahora todos los _mobs_ estarán en el grupo `mobs`.

![scene-group-mobs](img/scene_group_mobs.webp)

Podemos agregar la siguiente línea a la función `new_game()` en `Main`:

```
get_tree().call_group("mobs", "queue_free")
```

La función `call_group()` llama a la función nombrada en cada nodo de un grupo; en este caso, le estamos indicando a cada _mob_ que se elimine a sí mismo.

El juego está prácticamente terminado en este punto. En la próxima y última parte, lo perfeccionaremos un poco agregando un fondo, música en bucle y algunos atajos de teclado.

### Terminando

Ya hemos completado todas las funciones de nuestro juego. A continuación, se muestran algunos pasos restantes para agregar un poco más de "jugo" para mejorar la experiencia de juego.

No dudes en ampliar la jugabilidad con tus propias ideas.

#### Fondo

El fondo gris predeterminado no es muy atractivo, así que cambiemos su color. Una forma de hacerlo es usar un nodo `ColorRect`. Hazlo el primer nodo debajo de `Main` para que se dibuje detrás de los otros nodos. `ColorRect` solo tiene una propiedad: Color. Elige un color que te guste (por ejemplo: `#416c6d`) y selecciona **Control > Layout > Anchors Preset:** `Full Rect` ya sea en la barra de herramientas en la parte superior de la ventana gráfica o en el inspector para que cubra toda la pantalla.

También puedes agregar una imagen de fondo, si tienes una, usando un nodo `TextureRect` en su lugar.

#### Efectos de sonido

El sonido y la música pueden ser la forma más efectiva de agregar atractivo a la experiencia de juego. En la carpeta `art` de tu juego, tienes dos archivos de sonido: `House In a Forest Loop.ogg` para la música de fondo y `gameover.wav` para cuando el jugador pierde.

Agrega dos nodos `AudioStreamPlayer` como hijos de `Main`. Nombra uno de ellos `Music` y el otro `DeathSound`. En cada uno, haz clic en la propiedad `Stream`, selecciona **Load** y elige el archivo de audio correspondiente.

Todo el audio se importa automáticamente con la propiedad `Loop` deshabilitada. Si quieres que la música se reproduzca sin interrupciones, haz clic en la _flecha abajo_ del archivo cargado en **AudioStreamPlayer > Stream**, selecciona `Make Unique`, y luego haz clic en el archivo cargado en **AudioStreamPlayer > Stream** y marca la tilde en la casilla `Loop > On`:

![unique-resource-music](img/unique_resource_music.webp)

Para reproducir la música, agrega `$Music.play()` en la función **new_game()** y `$Music.stop()` en la función **game_over()**.

Finalmente, agrega `$DeathSound.play()` en la función **game_over()**.

```
func game_over():
	...
	$Music.stop()
	$DeathSound.play()

func new_game():
	...
	$Music.play()
```

#### Atajo de teclado

Dado que el juego se juega con controles de teclado, sería conveniente si también pudiéramos iniciar el juego presionando una tecla del teclado. Podemos hacer esto con la propiedad `Shortcut` del nodo **Button**.

En una lección anterior, creamos cuatro acciones de entrada para mover el personaje. Crearemos una acción de entrada similar para asignarla al botón de inicio.

Seleccione **Project" > "Project Settings** y luego haga clic en la pestaña **Input Map**. De la misma manera que creó las acciones de entrada de movimiento, cree una nueva acción de entrada llamada `start_game` y agregue una asignación de teclas para la tecla `Enter`.

![input-mapping-start_game](img/input-mapping-start_game.webp)

Ahora sería un buen momento para agregar compatibilidad con el controlador si tiene uno disponible. Conecte o empareje su controlador y luego, debajo de cada acción de entrada para la que desea agregar compatibilidad con el controlador, haga clic en el botón `+` y presione el botón, el pad direccional o la dirección del joystick correspondiente que desea asignar a la acción de entrada respectiva.

En la escena `HUD`, seleccione **StartButton** y busque su propiedad **StartButton > BaseButton > Shortcut** en el **Inspector**. Cree un nuevo _recurso_ **Shortcut** haciendo clic dentro del cuadro y seleccionando `New Shortcut`, luego haga clic en el reciente creado `[rayo] Shortcut` y abra la matriz **Events** y agréguele un nuevo elemento de matriz haciendo clic en `Array[InputEvent] (size 0)` y luego clic en botón `+ Add Element` .

![start-button-shortcut](img/start_button_shortcut.webp)

Cree una nueva **InputEventAction** haciendo clic en la caja `<empty>` y seleccionar `New InputEventAction`. Luego clic en la caja recientemente creada `InputEventAction` y en el área de texto **Action** escriba `start_game` luego del signo `&`.

![start-button-shortcut2](img/start_button_shortcut2.webp)

Ahora, cuando aparezca el botón `Start`, puede hacer clic en él o presionar Enter para iniciar el juego.

Y con eso, completó su primer juego 2D en Godot.

![dodge-preview](img/dodge_preview.webp)

Haz creado un personaje controlado por el jugador, enemigos que aparecen aleatoriamente en el tablero de juego, un contador de puntuación, implementado una finalización de juego terminado y un volver a empezar, una interfaz de usuario, sonidos y más. ¡Felicitaciones!

Aún queda mucho por aprender, pero puedes tomarte un momento para apreciar lo que lograste.

Y cuando estés listo, puedes pasar a **Tu primer juego en 3D** para aprender a crear un juego en 3D completo desde cero, en Godot.

#### Compartir el juego terminado con otros

Si quieres que la gente pruebe tu juego sin tener que instalar Godot, tendrás que exportar el proyecto para cada sistema operativo en el que quieras que se pueda jugar el juego. Consulta [Exportar proyectos](https://docs.godotengine.org/en/stable/tutorials/export/exporting_projects.html#doc-exporting-projects) para obtener instrucciones.

Después de exportar el proyecto, comprime el _archivo ejecutable_ y _PCK_ exportados (no los archivos del proyecto sin procesar) en un archivo **ZIP**, luego carga este archivo ZIP en un sitio web para compartir archivos.




## Capítulo 4. Tu primer juego 3D

En esta serie de tutoriales paso a paso, crearás tu primer juego 3D completo con Godot. Al final de la serie, tendrás un proyecto propio simple pero terminado como el gif animado que aparece a continuación:

![squash-the-creeps-final](img/squash-the-creeps-final.webp)

El juego que codificaremos aquí es similar a [Tu primer juego 2D](capitulo-3-tu-primer-juego-2d), con un giro: ahora puedes saltar y tu objetivo es aplastar a los bichos. De esta manera, reconocerás los patrones que aprendiste en el tutorial anterior y los desarrollarás con nuevo código y características.

Aprenderás a:

- Trabajar con _coordenadas 3D_ con una _mecánica de salto_.
- Usar _cuerpos cinemáticos_ para mover personajes 3D y detectar _cuándo y cómo chocan_.
- Usar _capas físicas_ y un _grupo_ para detectar interacciones con entidades específicas.
- Codificar un _juego procedimental_ básico creando instancias de monstruos en intervalos de tiempo regulares.
- Diseñar una animación de movimiento y cambiar su velocidad en tiempo de ejecución.
- Dibujar una _interfaz de usuario en un juego 3D_.

Y más.

Este tutorial es para principiantes que siguieron la serie completa de introducción. Comenzaremos lentamente con instrucciones detalladas y las acortaremos a medida que sigamos pasos similares. Si eres un programador experimentado, puedes buscar el código fuente de la demostración completa aquí: [Código fuente de Squash the Creep](https://github.com/godotengine/godot-3d-dodge-the-creeps).

> **Nota:** Puedes seguir esta serie sin haber hecho la de 2D. Sin embargo, si eres nuevo en el desarrollo de juegos, te recomendamos que comiences con 2D. El código de juego 3D siempre es más complejo y la serie 2D te dará las bases para seguir con más comodidad.

Preparamos algunos recursos del juego para que podamos pasar directamente al código. Puedes descargarlos aquí: [Recursos de Squash the Creeps](./assets/3d/squash_the_creeps_start_1.1.0.zip).

Primero trabajaremos en un _prototipo básico para el movimiento del jugador_. Luego _agregaremos los monstruos_ que generaremos aleatoriamente alrededor de la pantalla. Después de eso, _implementaremos la mecánica de salto y aplastamiento_ antes de refinar el juego con una buena animación. Terminaremos con la _puntuación_ y la _pantalla de reinicio_.

### Contenido

- [Configuración del área de juego](#configuración-del-área-de-juego)
- Escena del jugador y acciones de entrada
- Movimiento del jugador con código
- Diseño de la escena de la multitud
- Generación de monstruos
- Saltar y aplastar monstruos
- Matar al jugador
- Puntuación y repetición
- Animación de personajes
- Más allá

### Configuración del área de juego

En esta primera parte, vamos a configurar el área de juego. Empecemos importando los recursos de inicio y configurando la escena del juego.

Hemos preparado un proyecto Godot con los modelos 3D y los sonidos que usaremos para este tutorial, cuyo enlace se encuentra en el Índice. Si aún no lo has hecho, puedes descargar el archivo aquí: [Recursos de Squash the Creeps](./assets/3d/squash_the_creeps_start_1.1.0.zip).

Una vez que lo hayas descargado, extrae el archivo `.zip` en tu computadora. Abre el **Project Manager** de Godot y haz clic en el botón **Import**.

![01.import_button](./img/01.import_button.webp)

En la ventana emergente de importación, ingresa la ruta completa al directorio recién creado al descomprimir el archivo **.zip**: `squash_the_creeps_start/`. Puedes hacer clic en el botón **Browse** a la derecha para abrir un explorador de archivos y navegar hasta el archivo `project.godot` que contiene la carpeta.

![02.browse_to_project_folder](./img/02.browse_to_project_folder.webp)

Haz clic en **Import & Edit** para abrir el proyecto en el editor.

![03.import_and_edit](./img/03.import_and_edit.webp)

Puede aparecer una ventana que te notifique que el proyecto fue generado por una versión anterior de Godot. Haz clic en **Convert Full Project** para convertir el proyecto a tu versión actual de Godot.

![import_project_to_4.x_prompt](./img/import_project_to_4.x_prompt.webp)

El proyecto de inicio contiene un **ícono** y dos carpetas: `art/` y `fonts/`. Allí, encontrarás los recursos artísticos y la música que usaremos en el juego.

![04.assets](./img/04.assets.webp)

Hay dos modelos 3D, `player.glb` y `mob.glb`, algunos materiales que pertenecen a estos modelos y una pista de música.

#### Configuración del área jugable

Vamos a crear nuestra escena principal con un nodo simple (`Node`) como raíz. En el dock `Scene`, haz clic en el botón **Add Child Node** representado por un ícono `+` en la parte superior izquierda y haz doble clic en `Node`. ​​Nombra el nodo `Main`. Un método alternativo para cambiar el nombre del nodo es hacer clic derecho en nodo y elegir `Rename` (o `F2`). Alternativamente, para agregar un nodo a la escena, puedes presionar `Ctrl + A` (`Cmd + A` en macOS).

![04.assets](./img/05.webp)

Guarda la escena como `main.tscn` presionando `Ctrl + S` (`Cmd + S` en macOS).

Comenzaremos agregando un piso que evitará que los personajes se caigan. Para crear colisionadores estáticos como el piso, las paredes o los techos, puedes usar nodos `StaticBody3D`. Requieren nodos hijos `CollisionShape3D` para definir el área de colisión. Con el nodo principal seleccionado, agregue un nodo **StaticBody3D** y luego un nodo **CollisionShape3D**. Cambie el nombre de **StaticBody3D** a `Ground`.

![adding_static_body3D](./img/adding_static_body3D.webp)

Su árbol de escena debería verse así:

![06.staticbody_node](./img/06.webp)

Aparece un _signo de advertencia_ junto a **CollisionShape3D** porque no hemos definido su **forma**. Si hace clic en el _ícono_, aparece una ventana emergente para brindarle más información.

![07.collision_shape_warning](./img/07.webp)

Para crear una **forma**, seleccione el nodo **CollisionShape3D**, diríjase al **Inspector** y haga clic en el campo `<empty>` junto a la propiedad **Shape**. Cree un `New BoxShape3D`.

![08.create_box_shape3D](./img/08.create_box_shape3D.jpg)

La `BoxShape3D` es perfecta para paredes y suelos planos. Su grosor la hace fiable para bloquear incluso objetos que se mueven rápidamente.

Un _cubo con estrutura de alambre_ aparece en la ventana gráfica con **tres puntos naranjas**. Puede hacer clic y arrastrarlos para editar las extensiones de la forma de manera interactiva. También podemos establecer con precisión el tamaño en el inspector. Haga clic en `BoxShape3D` para expandir el recurso. Establezca **Size** en `x: 60`, `y: 2` y `z: 60`.

![08.box-size](./img/09.box_size.webp)

Las `CollisionShape` son invisibles. Necesitamos agregar un piso visual que vaya con él. Seleccione el nodo `Ground` y agregue un **MeshInstance3D** como su hijo.

![10](./img/10.webp)

En `Inspector`, haz clic en el campo junto a **Mesh** y crea un recurso `New BoxMesh` para crear un cubo visible.

![11.box_mesh](./img/11.box_mesh.webp)

Una vez más, es demasiado pequeño de forma predeterminada. Haz clic en el icono del cubo para expandir el recurso y establecer `Size` en `x: 60`, `y: 2` y `z: 60`.

![12.cube_resized](./img/12.webp)

Deberías ver una _losa ancha gris clara _ que cubre la cuadrícula y el _gizmo_ con los ejes azul, verde y rojo en el viewport.

Vamos a mover `Ground` hacia abajo para que podamos ver la cuadrícula del piso. Para ello, se puede utilizar la función  _ajuste a cuadrícula_ (grid snapping). El ajuste a cuadrícula se puede activar de dos formas en el editor 3D. La primera es presionando el botón **Use Snap** (o presionando la tecla `Y`). El segundo es seleccionar un nodo, arrastrar un controlador en el _gizmo_ y **luego** mantener presionada la tecla `Ctrl` mientras se hace clic para habilitar el ajuste mientras se mantiene presionada la tecla `Ctrl`.

![use_snap](./img/use_snap.webp)

Comience por configurar el ajuste con su método preferido. Luego mueva el nodo `Ground` usando el **eje Y** (la flecha verde en el gizmo).

![move_gizmo_y_axis](./img/move_gizmo_y_axis.webp)

> **Nota:** Si no puede ver el manipulador de objetos 3D como en la imagen anterior, asegúrese de que el modo **Select** esté activo en la barra de herramientas sobre la vista.

![move_gizmo_y_axis](./img/14.webp)

Mueva el suelo hacia abajo `1` metro para tener una cuadrícula de editor visible. Una etiqueta en la esquina inferior izquierda de la ventana gráfica le indica cuánto está trasladando el nodo.

![translation_amount](./img/15.webp)

> **Nota:** Al mover el nodo `Ground` hacia abajo, se mueven los dos elementos secundarios junto con él. Asegúrate de mover el nodo `Ground`, **no** _MeshInstance3D_ o _CollisionShape3D_.

En última instancia, **transform.position.y** de `Ground` debe ser `-1`.

![ground_down1meter](./img/ground_down1meter.webp)

Agreguemos una luz direccional para que nuestra escena no sea toda gris. Selecciona el nodo `Main` y agrega un nodo hijo **DirectionalLight3D**.

![create_directional_light3d](./img/create_directional_light3d.webp)

Necesitamos mover y rotar el nodo `DirectionalLight3D`. Muévelo hacia arriba haciendo clic y arrastrando la flecha verde del _gizmo_ y haz clic y arrastra en el arco rojo para rotarlo alrededor del eje X, hasta que el suelo esté iluminado.

En **Inspector**, activa **Shadow > Enabled** haciendo clic en la casilla de verificación.

![16.turn_on_shadows](./img/16.turn_on_shadows.webp)

En este punto, tu proyecto debería verse así:

![17.project_with_light](./img/17.project_with_light.webp)

Ese es nuestro punto de partida. En la siguiente parte, trabajaremos en la escena del jugador y el movimiento de la base.

### Escena del jugador y acciones de entrada

En las próximas dos lecciones, diseñaremos la escena del jugador, registraremos input actions (acciones de entrada) personalizadas y codificaremos el movimiento del jugador. Al final, tendrás un personaje jugable que se mueve en ocho direcciones.

Crea una nueva escena yendo al menú **Scene** en la parte superior izquierda y haciendo clic en **New Scene**.

![01.new_scene](./img/01.new_scene.png)

Crea un **CharacterBody3D** como nodo raíz:

![add_character_body3D](./img/add_character_body3D.webp)

Nombra el **CharacterBody3D** como `Player`. Los **CharacterBody** son complementarios a los **RigidBody2D** y **Area2D** utilizados en el tutorial del juego 2D. Al igual que los _rigid bodies (cuerpos rígidos)_, pueden moverse y colisionar con el entorno, pero en lugar de ser controlados por el motor de física, **tú** dictas su movimiento. Verás cómo usamos las características únicas del nodo cuando codificamos la mecánica de salto y aplastamiento.

> **Consulte:**
>
> Para obtener más información sobre los diferentes tipos de nodos de física, consulta la [Introducción a la física](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html#doc-physics-introduction).

Por ahora, vamos a crear una _configuración básica_ para el modelo 3D de nuestro personaje. Esto nos permitirá rotar el modelo más tarde a través del código mientras reproduce una animación.

Agrega un nodo `Node3D` como hijo de **Player** y nómbralo `Pivot`

![adding_node3D](./img/adding_node3D.webp)

Luego, en el dock **FileSystem**, expande la carpeta `art/` haciendo doble clic en ella y arrastra y suelta `player.glb` en **Pivot**.

![02.instantiating_the_model](./img/02.instantiating_the_model.webp)

Esto debería _instanciar_ el modelo como hijo de `Pivot`. Puedes cambiarle el nombre a `Character`.

![02.instantiating_the_model](./img/02.instantiating_the_model.webp)

> **Nota:**
>
> Los archivos `.glb` contienen datos de escenas 3D basados ​​en la especificación de código abierto **glTF 2.0**. Es una alternativa moderna y poderosa a un formato propietario como _FBX_, que Godot también admite. Para producir estos archivos, diseñamos el modelo en **Blender 3D** y lo exportamos a **glTF**.

Al igual que con todos los tipos de nodos de física, necesitamos un **collision shape** para que nuestro personaje colisione con el entorno. Seleccione el nodo `Player` nuevamente y agregue un nodo hijo **CollisionShape3D**. En el **Inspector**, en la propiedad **Shape**, agregue un `New SphereShape3D`.

![add_capsuleshape3d](./img/add_capsuleshape3d.webp)

El _estructura de alambre_ de la esfera aparece debajo del personaje.

![04.sphere_shape](./img/04.sphere_shape.png)

Será la _forma_ que el motor de física use para colisionar con el entorno, por lo que queremos que se ajuste mejor al modelo 3D. Hazla un poco más grande arrastrando el _punto naranja_ en el viewport. Mi esfera tiene un radio de aproximadamente `0.8` metros.

Luego, mueva la _forma de colisión_ hacia arriba para que su parte inferior se alinee aproximadamente con el plano de la cuadrícula.

![05_3D](./img/05_3D.webp)

Para que sea más fácil mover la _forma_, puede alternar la visibilidad del modelo haciendo clic en el _ícono del ojo_ junto a los nodos `Character` o `Pivot`.

![06.toggling_visibility](./img/06.toggling_visibility.webp)

Guarda la escena como `player.tscn`.

Con los nodos listos, casi podemos comenzar a codificar. Pero primero, debemos definir algunas _input actions (acciones de entrada)_.

#### Creación de acciones de entrada

Para mover el personaje, escucharemos la entrada del jugador, como presionar las teclas de flecha. En Godot, si bien podríamos escribir todas las combinaciones de teclas en código, existe un sistema poderoso que te permite asignar una etiqueta a un conjunto de teclas y botones. Esto simplifica nuestros scripts y los hace más legibles.

Este sistema es el **Input Map**. Para acceder a su editor, dirígete al menú _Project_ y selecciona _Project Settings_.

![07.project_settings](./img/07.project_settings.png)

En la parte superior, hay varias pestañas. Haz clic en _Input Map_. Esta ventana te permite agregar nuevas _acciones_ en la parte superior; son tus _etiquetas_. En la parte inferior, puedes vincular teclas a estas acciones.

![07-3D](./img/07-3D.webp)

Los proyectos de Godot vienen con algunas acciones predefinidas diseñadas para el diseño de la interfaz de usuario (ver la captura de pantalla anterior). Estas se volverán visibles si habilitas la casilla _Show Built-in Actions_. Podríamos usarlas aquí, pero en su lugar estamos definiendo las nuestras para que sean compatibles con los gamepads. Deja la casilla _Show Built-in Actions_ deshabilitada.

Vamos a nombrar nuestras acciones `move_left`, `move_right`, `move_forward`, `move_back` y `jump`.

Para agregar una acción, escribe su nombre en la barra de la parte superior y presiona **Enter**.

![07.adding_action](./img/07.adding_action.webp)

Crea las siguientes cinco acciones:

![08.actions_list_empty](./img/08.actions_list_empty.png)

Para vincular una tecla o botón a una _acción_, haz clic en el botón `+` a su derecha. Haz lo mismo con `move_left`. Presiona la tecla de **flecha izquierda** y haz clic en **OK**.

![left_inputmap](./img/left_inputmap.webp)

Vincula también la tecla **A** a la acción `move_left`.

![09](./img/09.webp)

Ahora agreguemos compatibilidad con el joystick izquierdo de un gamepad. Haz clic en el botón `+` nuevamente, pero esta vez, selecciona `Manual Selection > Joypad Axes`.

![joystick_axis_input](./img/joystick_axis_input.webp)

Selecciona el _eje X negativo_ en el joystick izquierdo.

![left_joystick_select](./img/left_joystick_select.webp)

Deja los demás valores como predeterminados y pulsa **OK**.

> **Nota:**
>
> Si quieres que los controladores tengan diferentes acciones de entrada, debes utilizar la opción _Devices_ en _Additional Options_. El _Device 0_ corresponde al primer gamepad conectado, el _Device 1_ corresponde al segundo mando conectado, y así sucesivamente.

Haz lo mismo con las demás acciones de entrada. Por ejemplo, vincula la **flecha derecha**, **D**, y el **eje positivo del joystick izquierdo** a `move_right`. Después de vincular todas las teclas, tu interfaz debería verse así:

![12.move_inputs_mapped](./img/12.move_inputs_mapped.webp)

La última acción que debes configurar es la acción `jump`. Vincula la tecla **Space** y el botón **A** del gamepad.

![13.joy_button_option](./img/13.joy_button_option.webp)

Tu acción de entrada de salto debería verse así:

![14.jump_input_action](./img/14.jump_input_action.webp)

Esas son todas las acciones que necesitamos para este juego. Puedes utilizar este menú para etiquetar cualquier grupo de teclas y botones en tus proyectos.

En la siguiente parte, codificaremos y probaremos el movimiento del jugador.

### Movemos al jugador con código

¡Es hora de codear! Vamos a usar las _input actions_ que creamos en la última parte para mover al personaje.

> **Nota:**
>
>Para este proyecto, seguiremos las convenciones de nombres de Godot.
>
>**GDScript:** las clases (nodos) usan `PascalCase`, las variables y funciones usan `snake_case` y las constantes usan `ALL_CAPS` (Ver [guía de estilo de GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html#doc-gdscript-styleguide)).

Haga clic derecho en el nodo `Player` y seleccione **Attach Script** para agregarle un nuevo script. En la ventana emergente, configure _Template_ en `Empty` antes de presionar el botón **Create**. La configuramos en _empty_ porque queremos escribir nuestro propio código para el movimiento del jugador.

![01.attach_script_to_player](./img/01.attach_script_to_player.webp)

Comencemos con las _propiedades_ de la clase. Vamos a definir una _velocidad de movimiento_ (`speed`), una aceleración de caída que representa la _gravedad_ (`fall_acceleration`) y una _velocidad_ que usaremos para mover al personaje (`target_velocity`).

```
extends CharacterBody3D

# Qué tan rápido se mueve el jugador en metros por segundo.
@export var speed = 14

# La aceleración de caída cuando está en el aire, en metros por segundo al cuadrado.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

```
Estas son propiedades comunes para un cuerpo en movimiento. El `target_velocity` es un _vector 3D_ que combina una velocidad con una dirección. Aquí, lo definimos como una propiedad porque queremos actualizar y reutilizar su valor en todos los fotogramas.

> **Nota:**
>
>Los valores son bastante diferentes del código 2D porque las distancias están expresadas en _metros_. Mientras que en 2D, mil unidades (píxeles) pueden corresponder solo a la mitad del ancho de la pantalla, en 3D, es un kilómetro.

Vamos a codificar el movimiento. Comenzamos calculando el vector de dirección de entrada utilizando el objeto global `Input`, en `_physics_process()`.

```
func _physics_process(delta):
	# Creamos una variable local para almacenar la dirección del input.
	var direction = Vector3.ZERO

	# Comprobamos cada entrada de movimiento y consecuentemente actualizamos la dirección.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		# Observa cómo trabajamos con los ejes x y z del vector.
		# En 3D, el plano XZ es el plano del suelo.
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
```

Aquí, vamos a realizar todos los cálculos utilizando la función virtual `_physics_process()`. Al igual que `_process()`, permite actualizar el nodo en cada fotograma, pero está diseñado específicamente para código relacionado con la física, como mover un cuerpo cinemático o rígido.

> **Ver también:**
>
>Para obtener más información sobre la diferencia entre `_process()` y `_physics_process()`, consulte [Idle and Physics Processing](https://docs.godotengine.org/en/stable/tutorials/scripting/idle_and_physics_processing.html#doc-idle-and-physics-processing).

Comenzamos inicializando una variable `direction` en `Vector3.ZERO`. Luego, verificamos si el jugador está presionando una o más de las entradas `move_*` y actualizamos de forma consecuente los componentes `x` y `z` del vector. Estos corresponden a los ejes del plano del suelo.

Estas cuatro condiciones nos dan _ocho posibilidades_ y, por lo tanto, _ocho direcciones posibles_.

En caso de que el jugador presione, digamos, tanto `W` como `D` simultáneamente, el vector tendrá una longitud de aproximadamente `1.4`. Pero si presiona una sola tecla, tendrá una longitud de `1`. Queremos que la longitud del vector sea constante y que no se mueva más rápido en diagonal. Para hacerlo, podemos llamar a su método `normalized()`.

```
#func _physics_process(delta):
	#...

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# Establecer la propiedad basis afectará la rotación del nodo.
		$Pivot.basis = Basis.looking_at(direction)
```

Aquí, solo normalizamos el vector si la dirección tiene una longitud mayor que cero, lo que significa que el jugador está presionando una tecla de dirección.

Calculamos la dirección hacia la que mira `$Pivot` creando una [**Basis**](https://docs.godotengine.org/en/stable/classes/class_basis.html#class-basis) que mira en la dirección `direction`.

Luego, actualizamos la velocidad. Tenemos que calcular la _velocidad del suelo_ y la _velocidad de caída_ por separado. Asegúrate de retroceder una pestaña para que las líneas estén dentro de la función `_physics_process()` pero fuera de la condición que acabamos de escribir anteriormente.

```
func _physics_process(delta):
	#...
	if direction != Vector3.ZERO:
		#...

	# Velocidad en el suelo
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Velocidad vertical
	if not is_on_floor(): #  Si está en el aire, cae hacia el suelo. Literalmente, gravedad.
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Movimiento del personaje
	velocity = target_velocity
	move_and_slide()
```

La función `CharacterBody3D.is_on_floor()` devuelve `true` si el cuerpo chocó contra el suelo en este fotograma. Por eso aplicamos gravedad al jugador **solo** mientras está en el aire.

Para la velocidad vertical, restamos la _aceleración de caída_ multiplicada por el _tiempo delta_ en cada fotograma. Esta línea de código hará que nuestro personaje caiga en cada cuadro, siempre que no esté sobre el suelo o colisione con él.

El motor de física solo puede detectar interacciones con paredes, el suelo u otros cuerpos durante un cuadro determinado si se producen movimientos y colisiones. Usaremos esta propiedad más adelante para codificar el salto.

En la última línea, llamamos a `CharacterBody3D.move_and_slide()`, que es un método poderoso de la clase `CharacterBody3D` que te permite mover un personaje suavemente. Si choca contra una pared a mitad de un movimiento, el motor intentará suavizarlo por ti. Utiliza el _velocity_ nativo de **CharacterBody3D**.

Y ese es todo el código que necesitas para mover al personaje en el suelo.

A continuación se incluye el código completo de `player.gd` como referencia:

```
extends CharacterBody3D

# Qué tan rápido se mueve el jugador en metros por segundo.
@export var speed = 14
# La aceleración de caída cuando está en el aire, en metros por segundo al cuadrado.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)

	# Velocidad en el suelo
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Velocidad vertical
	if not is_on_floor(): # Si está en el aire, cae hacia el suelo. Literalmente, gravedad
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Mover al personaje
	velocity = target_velocity
	move_and_slide()
```

#### Probando el movimiento de nuestro jugador

Vamos a colocar a nuestro jugador en la escena `Main` para probarlo. Para ello, necesitamos crear una instancia del jugador y luego agregar una **cámara**. A diferencia de lo que ocurre en 2D, en 3D no verás nada si tu _viewport_ no tiene una **cámara** apuntando a algo.

Guarda tu escena `Player` y abre la escena `Main`. Puedes hacer clic en la pestaña `Main` en la parte superior del editor para hacerlo.

![02](./img/02.webp)

Si antes cerraste la escena, dirígete al dock **FileSystem** y haz doble clic en `main.tscn` para volver a abrirlo.

Para crear una instancia de `Player`, haz clic derecho en el nodo `Main` y selecciona _Instantiate Child Scene_.

![03.instance_child_scene](./img/03.instance_child_scene.webp)

En la ventana emergente, haz doble clic en `player.tscn`. El personaje debería aparecer en el centro de la ventana gráfica.

##### Agregar una cámara

A continuación agregaremos la **cámara**. Al igual que hicimos con el _pivote de nuestro jugador_, vamos a crear una estructura básica. Haz clic derecho en el nodo `Main` nuevamente y selecciona _Add Child Node_. Crea un nuevo **Marker3D** y nómbralo `CameraPivot`. Selecciona `CameraPivot` y agrégale un nodo hijo `Camera3D`. Tu árbol de escena debería verse similar a esto:

![04.scene_tree_with_camera](./img/04.scene_tree_with_camera.webp)

Observa la casilla de verificación _Preview_ que aparece en la parte superior izquierda de la vista 3D cuando tienes la cámara seleccionada. Puedes hacer clic en ella para obtener una vista previa de la proyección de la cámara en el juego.

![05-moving-player-code](./img/05-moving-player-code.webp)

Vamos a usar el _Pivot_ para rotar la cámara como si estuviera en una grúa. Primero, dividiremos la vista 3D para poder navegar libremente por la escena y ver lo que ve la cámara.

En la barra de herramientas justo encima del viewport, haz clic en _View_ y luego en _2 Viewports_. También puedes presionar `Ctrl + 2` (`Cmd + 2` en macOS).

![12.viewport_change](./img/12.viewport_change.webp)

![06-viewport](./img/06-viewport.webp)

En la vista inferior, selecciona tu `Camera3D` y activa _Preview_ de la cámara haciendo clic en la casilla de verificación correspondiente:

![07-perspective](./img/07-perspective.webp)

En la vista superior, asegúrate de que tu `Camera3D` esté seleccionada y mueve la cámara unas `19` unidades en el eje Z (arrastra la flecha azul).

![08-perspective-preview](./img/08-perspective-preview.webp)

Aquí es donde ocurre la magia. Selecciona _CameraPivot_ y gíralo `-45` grados alrededor del eje X (usando el círculo rojo). Verás que la cámara se mueve como si estuviera unida a una grúa.

![09-perspective-preview-b](./img/09-perspective-preview-b.webp)

Puedes ejecutar la escena presionando `F6` y las teclas flecha para mover el personaje.

![10-perspective-preview-c](./img/10-perspective-preview-c.webp)

Podemos ver un espacio vacío alrededor del personaje debido a la proyección en perspectiva. En este juego, vamos a usar una proyección ortográfica en su lugar para encuadrar mejor el área de juego y facilitarle al jugador la lectura de distancias.

Vuelve a seleccionar `Camera` y en `Inspector`, establece _Projection to Orthogonal_ y _Size_ en `19`. El personaje ahora debería verse más plano y el suelo debería llenar el fondo.

> **Nota:**
>
> Al usar una cámara ortogonal en Godot 4, la calidad de la sombra direccional depende del valor _Far value_ de la cámara. Cuanto mayor sea el valor _Far_, más lejos podrá ver la cámara. Sin embargo, valores más altos de _Far_ también reducen la calidad de las sombras, ya que la representación de las sombras debe cubrir una distancia mayor.
>
> Si las sombras direccionales se ven demasiado borrosas después de cambiar a una cámara ortogonal, reduzca la propiedad _Far_ de la cámara a un valor menor, como por ejemplo `100`. No reduzca demasiado esta propiedad _Far_, o los objetos en la distancia comenzarán a desaparecer.

![13.camera3d_values](./img/13.camera3d_values.webp)

Pruebe su escena y debería poder moverse en las ocho direcciones y no atravesar el piso.

Finalmente ya tenemos el movimiento del jugador y la vista en su lugar. A continuación, trabajaremos en los _mobs_.

### Diseño de la escena de los mobs

En esta parte, vas a codear los monstruos, a los que llamaremos _mobs_. En la siguiente lección los generaremos aleatoriamente alrededor del área jugable.

Diseñemos los _mobs_ en una nueva escena. La estructura de nodos será similar a la escena `player.tscn`.

Crea una escena con, una vez más, un nodo **CharacterBody3D** como raíz. Llámalo `Mob`. Agrega un nodo hijo **Node3D**, llámalo `Pivot`. Arrastra y suelta el archivo `mob.glb` desde el dock **FileSystem** hasta el `Pivot` para agregar el modelo 3D del monstruo a la escena.

![drag_drop_mob](./img/drag_drop_mob.webp)

Puedes cambiar el nombre del nodo **mob** recién arrastrado a `Character`.

![01-mobs](./img/01-mobs.webp)

Necesitamos una _forma de colisión_ para que nuestro cuerpo funcione. Haz clic derecho en el nodo `Mob`, la raíz de la escena, y haz clic en **Add Child Node**.

![02-mobs](./img/02-mobs.webp)

Agrega un **CollisionShape3D**.

![03-mobs](./img/03-mobs.webp)

En **Inspector**, asigna un _New BoxShape3D_ a la propiedad _Shape_.

![08.create_box_shape3D](./img/08.create_box_shape3D.jpg)

Deberíamos cambiar su tamaño para que se ajuste mejor al modelo 3D. Puedes hacerlo de forma interactiva haciendo clic y arrastrando los puntos naranjas.

El **BoxShape3D** debe tocar el suelo y ser un poco más delgado que el modelo. Los motores de física funcionan de tal manera que si la **SphereShape3D** del jugador llegara a tocar la esquina del **BoxShape3D**, se producirá una colisión. Si el **BoxShape3D** fuera un poco más grande en comparación con el modelo 3D, podrías morir a cierta distancia del monstruo y el juego parecerá injusto para los jugadores.

![05-mobs](./img/05-mobs.webp)

Observa que mi **BoxShape3D** es más alto que el monstruo. Esto está bien en este juego porque estamos mirando la escena desde arriba y usando una perspectiva fija. Las _formas de colisión_ no tienen que coincidir exactamente con el modelo. Cuando pruebas el juego es la _forma en que se siente_ lo que debería determinar su forma y tamaño.

#### Eliminar mobs de la pantalla

Vamos a generar _mobs_ a intervalos regulares de tiempo en el nivel del juego. Si no tenemos cuidado, su número podría aumentar hasta el infinito, y no queremos que eso suceda. Cada instancia de _mobs_ tiene un costo de memoria y de procesamiento, y no queremos pagar por ello cuando el _mob_ está fuera de la pantalla.

Una vez que un _mob_ sale de la pantalla, ya no lo necesitamos, por lo que deberíamos eliminarlo. Godot tiene un nodo que detecta cuando los objetos salen de la pantalla, **VisibleOnScreenNotifier3D**, y lo vamos a usar para destruir a nuestros _mobs_.

> **Nota:**
>
> Cuando sigues creando instancias de un objeto, hay una técnica que puedes usar para evitar el costo de crear y destruir instancias todo el tiempo llamada _pooling (agrupación)_. Consiste en crear previamente una matriz de objetos y reutilizarlos una y otra vez.
>
> Cuando trabajas con GDScript, no necesitas preocuparte por esto. La razón principal para usar _pools_ es evitar congelamientos con lenguajes de _recolección de basura_ como C# o Lua. GDScript usa una técnica diferente para administrar la memoria, _reference counting (conteo de referencias)_, la cual no contempla esa amenaza. Puedes aprender más sobre eso aquí: [Administración de memoria](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#doc-gdscript-basics-memory-management).

Selecciona el nodo `Mob` y agrega un nodo hijo `VisibleOnScreenNotifier3D`. Aparece otro cubo, rosa esta vez. Cuando este cubo salga completamente de la pantalla, el nodo emitirá una señal.

![06-mobs](./img/06-mobs.webp)

Ajusta el tamaño del cubo usando los _puntos naranjas_ hasta que cubra todo el modelo 3D.

![07-mobs](./img/07-mobs.webp)

##### Codificación del movimiento deL mob

Implementemos el movimiento del _mob_. Lo haremos en dos pasos. Primero, escribiremos un script en `Mob` que defina una función para inicializar el _mob_. Luego, codificaremos el mecanismo de generación aleatorio en la escena `main.tscn` y llamaremos a la función desde allí.

Adjuntaremos un script a `Mob` con **Attach Script**.

![08-mobs](./img/08-mobs.webp)

A continuación, se muestra el código de movimiento con el que comenzaremos. Definimos dos propiedades, `min_speed` y `max_speed`, para definir un rango de velocidad aleatorio, que luego usaremos para definir `CharacterBody3D.velocity`.

```
extends CharacterBody3D

# Velocidad mínima de la criatura en metros por segundo.
@export var min_speed = 10
# Velocidad máxima de la criatura en metros por segundo.
@export var max_speed = 18


func _physics_process(_delta):
	move_and_slide()
```

De manera similar al jugador, movemos el _mob_ en cada cuadro llamando a la función `CharacterBody3D.move_and_slide()`. Esta vez, no actualizamos `velocity` en cada fotograma; queremos que el _mob_ se mueva a una velocidad constante y abandone la pantalla, incluso si chocara contra un obstáculo.

Necesitamos definir otra función para calcular `CharacterBody3D.velocity`. Esta función girará al _mob_ hacia el jugador y aleatorizará tanto su ángulo de movimiento como su velocidad.

La función tomará como argumentos a  `start_position`, la posición de aparición del _mob_, y a `player_position`, la posicion del jugador.

Posicionamos al _mob_ en `start_position` y lo giramos hacia el jugador usando el método `look_at_from_position()`, y aleatorizamos el ángulo rotando una cantidad aleatoria alrededor del eje Y. A continuación, `randf_range()` genera un valor aleatorio entre `-PI / 4` radianes y `PI / 4` radianes.

```
# Esta función se llamará desde la escena principal.
func initialize(start_position, player_position):
	# Posicionamos al mob colocándolo en start_position
	# y lo rotamos hacia player_position, de modo que mire al jugador.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# Rotamos este monstruo aleatoriamente dentro del rango de -45 y +45 grados,
	# para que no se mueva directamente hacia el jugador.
	rotate_y(randf_range(-PI / 4, PI / 4))
```

Obtuvimos una posición aleatoria, ahora necesitamos una `random_speed`. `randi_range()` será útil ya que proporciona valores enteros aleatorios, y usaremos `min_speed` y `max_speed`. `random_speed` es solo un entero, y lo usamos para multiplicar nuestro `CharacterBody3D.velocity`. Después de aplicar `random_speed`, rotamos el Vector3 `CharacterBody3D.velocity`  hacia el jugador.

##### Saliendo de la pantalla

Aún tenemos que destruir a los _mobs_ cuando abandonan la pantalla. Para ello, conectaremos la señal `screen_exited` de nuestro nodo **VisibleOnScreenNotifier3D** a `Mob`.

Regresa al viewpor 3D haciendo clic en la etiqueta _3D_ en la parte superior del editor. También puedes presionar `Ctrl + F2` (`Opt + 2` en macOS).

![09-mobs](./img/09-mobs.webp)

Selecciona el nodo **VisibleOnScreenNotifier3D** y, en el lado derecho de la interfaz, navega hasta el dock **Node**. Haz doble clic en la señal `screen_exited()`.

![10.node_dock](./img/10.node_dock.webp)

Conecta la señal a `Mob`

![11.connect_signal](./img/11.connect_signal.webp)

Esto agregará una nueva función en tu script de _mob_, `_on_visible_on_screen_notifier_3d_screen_exited()`. Desde allí, llama al método `queue_free()`. Esta función destruye la instancia en la que se llama.

```
func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
```

¡Nuestro monstruo está listo para entrar al juego! En la siguiente parte, generarás _mobs_ en el nivel del juego.

A continuación, se incluye el script `mob.gd` completo como referencia:

```
extends CharacterBody3D

# Velocidad mínima del monstruo en metros por segundo.
@export var min_speed = 10
# Velocidad máxima del monstruo en metros por segundo.
@export var max_speed = 18

func _physics_process(_delta):
	move_and_slide()

# Esta función será llamada desde la escena Main.
func initialize(start_position, player_position):
	# Posicionamos al monstruo colocándolo en start_position
	# y lo rotamos hacia player_position, de modo que mire al jugador.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# Rotamos este monstruo aleatoriamente dentro de un rango de -45 y +45 grados,
	# para que no se mueva directamente hacia el jugador.
	rotate_y(randf_range(-PI / 4, PI / 4))

	# Calculamos una velocidad aleatoria (entero)
	var random_speed = randi_range(min_speed, max_speed)
	# Calculamos una velocidad hacia adelante (forward velocity) que representa la velocidad.
	velocity = Vector3.FORWARD * random_speed
	# We then rotate the velocity vector based on the mob's Y rotation
	# in order to move in the direction the mob is looking.
	# Luego rotamos el vector de velocidad en función de la rotación del eje Y del mob
	# para moverlo en la dirección en la que mira.
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
```
### Generación de mobs

En esta parte, vamos a generar mobs a lo largo de un camino de forma aleatoria. Al final, tendrás mobs deambulando por el tablero de juego.

![01-spawing-mobs](./img/01-spawing-mobs.webp)

Haz doble clic en main.tscn en el dock del Sistema de archivos para abrir la escena principal.

Antes de dibujar el camino, vamos a cambiar la resolución del juego. Nuestro juego tiene un tamaño de ventana predeterminado de 1152x648. Lo configuraremos en 720x540, un pequeño y bonito cuadro.

Ve a Proyecto -> Configuración del proyecto.

![02-spawing-mobs](./img/02-spawing-mobs.webp)

Si todavía tienes abierto el Mapa de entrada, cambia a la pestaña General.

En el menú de la izquierda, navega hacia abajo hasta Pantalla -> Ventana. A la derecha, establece el Ancho en 720 y la Altura en 540.

![03.window_settings](./img/03.window_settings.webp)

#### Creando la ruta de aparición

Como hiciste en el tutorial del juego 2D, vas a diseñar una ruta y usar un nodo **PathFollow3D** para tomar muestras de ubicaciones aleatorias en ella.

Sin embargo, en 3D, es un poco más complicado dibujar la ruta. Queremos que esté alrededor de la vista del juego para que los _mobs_ aparezcan justo afuera de la pantalla. Pero si dibujamos una ruta, no la veremos desde la vista previa de la cámara.

Para encontrar los límites de la vista, podemos usar algunas _mallas de sustitución (placeholder meshes)_. Tu ventana gráfica aún debería estar dividida en dos partes, con la vista previa de la cámara en la parte inferior. Si ese no es el caso, presiona `Ctrl + 2` (`Cmd + 2` en macOS) para dividir la vista en dos. Selecciona el nodo **Camera3D** y haz clic en la casilla de verificación _Preview_ en el viewport inferior.

![04.camera_preview](./img/04.camera_preview.png)

##### Agregado de cilindros de sustitución

Agreguemos las mallas de sustitución. Agregue un nuevo **Node3D** como hijo del nodo principal y nómbrelo `Cylinders`. Lo usaremos para agrupar los cilindros. Seleccione _Cylinders_ y agregue un nodo hijo **MeshInstance3D**.

![05-spawning-mobs](./img/05-spawning-mobs.webp)

En **Inspector**, asigne un `New CylinderMesh` a la propiedad _Mesh_.

![06-spawning-mobs](./img/06-spawning-mobs.webp)

Establezca la ventana gráfica superior en la vista ortogonal superior utilizando el menú en la esquina superior izquierda de la ventana gráfica. Alternativamente, puede presionar la tecla `7` del teclado de números.

![07-spawning-mobs](./img/07-spawning-mobs.webp)

La cuadrícula puede distraer. Puede alternarla yendo al menú _View_ en la barra de herramientas y haciendo clic en _View Grid_.

![08-spawning-mobs](./img/08-spawning-mobs.webp)

Ahora desea mover el cilindro a lo largo del plano del suelo, mirando la vista previa de la cámara en la ventana gráfica inferior. Para hacerlo, recomiendo usar el ajuste de cuadrícula. Puedes alternarlo haciendo clic en el _ícono del imán_ en la barra de herramientas o presionando la tecla `Y`.

![09-spawning-mobs](./img/09-spawning-mobs.webp)

Mueve el cilindro para que quede justo afuera de la vista de la cámara en la esquina superior izquierda.

![10-spawning-mobs](./img/10-spawning-mobs.webp)

Vamos a crear copias del cilindro y colocarlas alrededor del área de juego. Presiona `Ctrl + D` (`Cmd + D` en macOS) para duplicar el nodo. También puedes hacer clic derecho en el nodo en el dock _Scene_ y seleccionar _Duplicate_. Mueve la copia hacia abajo a lo largo del _eje Z azul_ hasta que esté justo afuera de la vista previa de la cámara.

Selecciona ambos cilindros seleccionando uno de ellos, luego presionando la tecla `Shift` y sin soltarla, hacer clic en el que no está seleccionado y por último duplícalos.

![11-spawning-mobs](./img/11-spawning-mobs.webp)

Muévelos hacia la derecha arrastrando el _eje X rojo_.

![12-spawning-mobs](./img/12-spawning-mobs.webp)

Son un poco difíciles de ver en blanco, ¿no? Hagamos que se destaquen dándoles un nuevo material.

En 3D, los _materiales_ definen las propiedades visuales de una superficie, como su color, cómo refleja la luz y más. Podemos usarlos para cambiar el color de una malla.

Podemos actualizar los cuatro cilindros a la vez. Seleccione todas las instancias de las mallas en el dock _Scene_. Para ello, puede hacer clic en la primera y hacer clic con la tecla `Shift` en la última.

![13-spawning-mobs](./img/13-spawning-mobs.webp)

En _Inspector_, expanda la sección _Material_ y asigne un `New StandardMaterial3D` a la ranura `0`.

![14-spawning-mobs](./img/14.multi_material_selection.webp)

![standard_material](./img/standard_material.webp)

Haga clic en el icono de esfera para abrir el recurso de _material_. Obtendrá una vista previa del material y una larga lista de secciones llenas de propiedades. Puede usarlas para crear todo tipo de superficies, desde metal hasta roca o agua.

Expanda la sección _Albedo_.

![albedo_section](./img/albedo_section.webp)

Establezca el color en algo que contraste con el fondo, como un naranja brillante.

![15-spawning-mobs](./img/15-spawning-mobs.webp)

Ahora podemos usar los cilindros como guías. Plégelos en el dock _Scene_ haciendo clic en la _flecha gris_ junto a ellos. En el futuro, también puede alternar su visibilidad haciendo clic en el icono del _ojo_ junto a `Cylinders`.

![16-spawning-mobs](./img/16-spawning-mobs.webp)

Agregue un nodo hijo **Path3D** al nodo `Main`. En la barra de herramientas, aparecen cuatro iconos. Haga clic en la herramienta _Add Point_, el icono con el signo `+` verde.

![17-spawning-mobs](./img/17-spawning-mobs.webp)

> **Nota:**
>
> Puede pasar el cursor sobre cualquier icono para ver una descripción emergente de la herramienta.

Haga clic en el centro de cada cilindro para crear un punto. Luego, haga clic en el icono _Close Curve_ en la barra de herramientas para cerrar la ruta. Si algún punto está un poco desviado, puede hacer clic y arrastrarlo para reposicionarlo.

![18-spawning-mobs](./img/18-spawning-mobs.webp)

Su ruta debería verse así:

![19-spawning-mobs](./img/19-spawning-mobs.webp)

Para muestrear posiciones aleatorias en ella, necesitamos un nodo **PathFollow3D**. Agregue un _PathFollow3D_ como hijo de _Path3D_. Cambie el nombre de los dos nodos a `SpawnLocation` (para _PathFollow3D_) y `SpawnPath` (para _Path3D_). Son nombres más denominativos que descriptivos:

![20-spawning-mobs](./img/20-spawning-mobs.webp)

Con esto, estamos listos para codificar el mecanismo de generación.

#### Generación aleatoria de mobs

Haz clic derecho en el nodo `Main` y adjúntale un nuevo script.

Primero exportamos una variable `mob_scene` a _Inspector_ para poder asignarle `mob.tscn` o cualquier otro _mobs_.

```
extends Node

@export var mob_scene: PackedScene
```

Queremos generar _mobs_ a intervalos de tiempo regulares. Para ello, debemos volver a la escena y agregar un temporizador. Sin embargo, antes de eso, debemos asignar el archivo `mob.tscn` a la propiedad `mob_scene` anterior (de lo contrario, ¡es nula!).

Vuelve a la pantalla **3D** y selecciona el nodo `Main`. Arrastra `mob.tscn` desde el dock _FileSystem_ hasta la ranura _Mob Scene_ en _Inspector_.

![21-spawning-mobs](./img/21-spawning-mobs.webp)

Agrega un nuevo nodo **Timer** como hijo de `Main`. Nómbralo `MobTimer`.

![22-spawning-mobs](./img/22-spawning-mobs.webp)

En _Inspector_, establece _Wait Time_ en `0.5` segundos y activa en `On` la propiedad _Autostart_ para que se inicie automáticamente cuando ejecutemos el juego.

![23-spawning-mobs](./img/23-spawning-mobs.webp)

Los temporizadores emiten una señal `timeout` cada vez que llegan al final de su _Wait Time_. De forma predeterminada, se reinician automáticamente y emiten la señal de forma cíclica. Podemos conectarnos a esta señal desde el nodo **Main** para generar monstruos cada `0.5` segundos.

Con `MobTimer` aún seleccionado, dirígete al dock **Node** a la derecha y haz doble clic en la señal `timeout`.

![24-spawning-mobs](./img/24-spawning-mobs.webp)

Conéctalo al nodo `Main`.

![24.connect_timer_to_main](./img/24.connect_timer_to_main.webp)

Esto te llevará de regreso al script, con una nueva función `_on_mob_timer_timeout()` vacía.

Codifiquemos la lógica de generación de mobs. Vamos a:

1. Instanciar la escena _mob_.
2. Tomar una muestra de una posición aleatoria en la ruta de generación.
3. Obtener la posición del jugador.
4. Llama al método `initialize()` del mob, pasándole la posición aleatoria y la posición del jugador.
5. Agrega un mob como un hijo del nodo _Main_.

```
func _on_mob_timer_timeout():
	# Crea una nueva instancia de la escena Mob.
	var mob = mob_scene.instantiate()

	# Elige una ubicación aleatoria en SpawnPath.
	# Almacenamos la referencia al nodo SpawnLocation.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# Y le damos un valor de desplazamiento aleatorio.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)

	# Genera el mob agregándolo a la escena Main.
	add_child(mob)
```

Arriba, `randf()` produce un valor aleatorio entre `0` y `1`, que es lo que espera el `progress_ratio` del nodo **PathFollow**: _0_ es el comienzo de la ruta, _1_ es el final de la ruta. La ruta que hemos establecido es alrededor de la ventana gráfica de la cámara, por lo que cualquier valor aleatorio entre _0_ y _1_ es una posición aleatoria junto a los bordes de la ventana gráfica.

Ten en cuenta que si eliminas `Player` de la escena principal, la siguiente línea:

```
var player_position = $Player.position
```
da un error porque no habría ningún `$Player`.

A continuación, se muestra el script `main.gd` completo hasta el momento, como referencia:

```
extends Node

@export var mob_scene: PackedScene


func _on_mob_timer_timeout():
	# Crea una nueva instancia de la escena Mob.
	var mob = mob_scene.instantiate()

	# Elige una ubicación aleatoria en SpawnPath.
	# Almacenamos la referencia al nodo SpawnLocation.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# Y le damos un valor de desplazamiento aleatorio.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)

	# Genera el mob agregándolo a la escena Main.
	add_child(mob)
```

Puedes probar la escena presionando `F6`. Deberías ver que los mobs aparecen y se mueven en línea recta.

![25-spawning-mobs](./img/25-spawning-mobs.webp)

Por ahora, chocan y se deslizan entre sí cuando sus caminos se cruzan. Abordaremos esto mismo en la siguiente parte.

### Salto y aplastamiento de mobs

En esta parte, agregaremos la capacidad de saltar y aplastar a los mobs. En la próxima lección, haremos que el jugador muera cuando un monstruo lo golpee en el suelo.

Primero, tenemos que cambiar algunas configuraciones relacionadas con las interacciones físicas. Ingrese al mundo de las [capas físicas](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html#doc-physics-introduction-collision-layers-and-masks).

#### Control de interacciones físicas

Los cuerpos físicos tienen acceso a dos propiedades complementarias: _layers (capas)_ y _masks (máscaras)_:

- Las _layers_ definen en qué capa(s) física(s) se encuentra un objeto.
- Las _masks_ controlan las capas que un cuerpo escuchará y detectará. Esto afecta la _detección de colisiones_. Cuando desea que dos cuerpos interactúen, necesita que al menos uno tenga una máscara correspondiente al otro.

Si esto es confuso, no se preocupe, veremos tres ejemplos en un segundo.

El punto importante es que puede usar _layers_ y _masks_ para filtrar _interacciones físicas_, controlar el rendimiento y eliminar la necesidad de condiciones adicionales en su código.

De forma predeterminada, todos los cuerpos y áreas de física se configuran tanto en la _layer_ como en la _mask_ número `1`. Esto significa que todos colisionan entre sí.

Las capas de física se representan con números, pero podemos darles nombres para llevar un registro de cada una.

##### Establecer nombres de capa

Démosle un nombre a nuestras capas de física. Vaya a _Project > Project Settings_.

![02-jumping-squashing-mobs](./img/02-jumping-squashing-mobs.webp)

En el menú de la izquierda, navegue hacia abajo hasta _Layer Names > 3D Physics_. Puede ver una lista de capas con un campo al lado de cada una de ellas a la derecha. Puede establecer sus nombres allí. Nombra las primeras tres capas: `player`, `enemies` y `world`, respectivamente.

![03.physics_layers](./img/03.physics_layers.webp)

Ahora, podemos asignarlas a nuestros nodos de física.

##### Asignación de layers y masks

En la escena **Main**, seleccione el nodo `Ground`. En **Inspector**, expanda la sección _Collision_. Allí, puede ver las capas y máscaras del nodo como una cuadrícula de botones.

![04.default_physics_properties](./img/04.default_physics_properties.webp)

El _Ground (suelo)_ es parte del _world (mundo)_, por lo que queremos que sea parte de la tercera capa. Haz clic en el botón iluminado para **desactivar** la primera _Layer_ y **activar** la _tercera_. Luego, **desactiva** la _Mask_ haciendo clic en ella.

![05.toggle_layer_and_mask](./img/05.toggle_layer_and_mask.webp)

Como se mencionó anteriormente, la propiedad _Mask_ permite que un nodo escuche la interacción con otros objetos físicos, pero no necesitamos que tenga colisiones. El suelo no necesita escuchar nada; solo está allí para evitar que las criaturas caigan.

Ten en cuenta que puedes hacer clic en el botón `...` en el lado derecho de las propiedades para ver una lista de casillas de verificación con nombre.

![06-jumping-squashing-mobs](./img/06-jumping-squashing-mobs.webp)

A continuación están `Player` y la `Mob`. Abre `player.tscn` haciendo doble clic en el archivo en el dock _FileSystem_.

Selecciona el nodo _Player_ y establece su _Collision > Mask_ en "enemies" y "world". Puedes dejar la propiedad predeterminada _Layer_ como está, porque la primera capa es la capa "player".

![07.player_physics_mask](./img/07.player_physics_mask.webp)

Luego, abre la escena `Mob` haciendo doble clic en `mob.tscn` y selecciona el nodo **Mob**.

Configura su _Collision > Layer_ en "enemies" y desconfigura su _Collision > Mask_, dejando la máscara vacía.

![08.mob_physics_mask](./img/08.mob_physics_mask.webp)

Estas configuraciones significan que los mobs se moverán entre sí. Si quieres que los mobs colisionen y se deslicen entre sí, **activa** la máscara "enemies".

> **Nota:**
>
> Los mobs no necesitan enmascarar la capa `world` porque solo se mueven en el plano XZ. No les aplicamos ninguna gravedad por diseño.

#### Salto

La mecánica de salto en sí requiere solo dos líneas de código. Abre el script _Player_. Necesitamos un valor para controlar la fuerza del salto y actualizar `_physics_process()` para codificar el salto.

Después de la línea que define `fall_acceleration`, en la parte superior del script, agrega `jump_impulse`.

```
#...
# Impulso vertical aplicado al personaje al saltar, en metros por segundo.
@export var jump_impulse = 20
```

Dentro de `_physics_process()`, agrega el siguiente código antes del bloque de código `move_and_slide()`.

```
func _physics_process(delta):
	#...

	# Salto.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse

	#...
```

¡Esto es todo lo que necesitas para saltar!

El método `is_on_floor()` es una herramienta de la clase **CharacterBody3D**. Devuelve `true` si el cuerpo chocó contra el suelo en este fotograma. Por eso aplicamos gravedad a _Player_: chocamos contra el suelo en lugar de flotar sobre él como los mobs.

Si el personaje está en el suelo y el jugador presiona _"jump"_, le damos instantáneamente mucha velocidad vertical. En el mundo de los juegos, quieres que los controles sean muy sensibles, como por ejemplo: dar aumentos de velocidad instantáneos como estos, si bien son poco realistas, se sienten genial.

Observa que el _eje Y_ es positivo hacia **arriba**. Eso es diferente en 2D, donde el _eje Y_ es positivo hacia **abajo**.

#### Aplastamiento de mobs

A continuación, agreguemos la mecánica de _aplastamiento_. Haremos que el personaje rebote sobre los mobs y los mate al mismo tiempo.

Necesitamos detectar colisiones con un mob y diferenciarlas de las colisiones con el suelo. Para hacerlo, podemos usar la función de etiquetado de [grupo](https://docs.godotengine.org/en/stable/tutorials/scripting/groups.html#doc-groups) de Godot.

Abre la escena `mob.tscn` nuevamente y selecciona el nodo `Mob`. Vaya al dock _Node_ a la derecha para ver una lista de _señales_. El dock _Node_ tiene dos pestañas: _Signals_, que ya ha utilizado, y _Groups_, que le permite asignar etiquetas a los nodos.

Haga clic en él para revelar un campo donde puedas escribir un _nombre de etiqueta_. Ingrese `mob` en el campo y haga clic en el botón _Add_.

![09-jumping-squashing-mobs](./img/09-jumping-squashing-mobs.webp)

Aparece un ícono en el dock _Scene_ para indicar que el nodo es parte de al menos un grupo.

![10-jumping-squashing-mobs](./img/10-jumping-squashing-mobs.webp)

Ahora podemos usar el _grupo_ del código para distinguir las colisiones _con monstruos_ de las colisiones _con el piso_.

##### Codificación de la mecánica del aplastamiento

Vuelve al script de _Player_ para codificar el aplastamiento y el rebote.

En la parte superior del script, necesitamos otra propiedad, `bounce_impulse`. Al aplastar a un enemigo, no necesariamente queremos que el personaje se eleve tan alto como cuando salta.

```
# Impulso vertical aplicado al personaje al rebotar sobre un mob en
# metros por segundo.
@export var bounce_impulse = 16
```

Luego, después del bloque de código **Salto** que agregamos anteriormente en `_physics_process()`, agrega el siguiente bucle. Con `move_and_slide()`, Godot hace que el cuerpo se mueva a veces varias veces seguidas para suavizar el movimiento del personaje. Por lo tanto, tenemos que repetir todas las colisiones que puedan haber ocurrido.

En cada iteración del bucle, verificamos si aterrizamos sobre un enemigo. Si es así, lo eliminamos y rebotamos.

Con este código, si no se produjeron colisiones en un fotograma determinado, el bucle no se ejecutará.

```
func _physics_process(delta):
	#...

	# Iteramos a través de todas las colisiones que ocurrieron en este fotograma
	for index in range(get_slide_collision_count()):
		# Obtenemos una de las colisiones con el jugador
		var collision = get_slide_collision(index)

		# Si la colisión es con el suelo:
		if collision.get_collider() == null:
			continue

		# Si colisión es con un mob:
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# Comprobamos que lo estemos golpeando desde arriba:
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				# Si es así, lo aplastamos y rebotamos
				mob.squash()
				target_velocity.y = bounce_impulse
				# Prevenimos más llamadas duplicadas
				break
```

Son muchas funciones nuevas. Aquí hay más información sobre ellos.

Las funciones `get_slide_collision_count()` y `get_slide_collision()` provienen de la clase **CharacterBody3D** y están relacionadas con `move_and_slide()`.

`get_slide_collision()` devuelve un objeto **KinematicCollision3D** que contiene información sobre dónde y cómo ocurrió la colisión. Por ejemplo, usamos su propiedad `get_collider` para verificar si chocamos con un _mob_ llamando a `is_in_group()` en ella: `clash.get_collider().is_in_group("mob")`.

> **Nota:**
>
> El método `is_in_group()` está disponible en cada [Node](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node).

Para verificar que estamos aterrizando sobre el mob, usamos el _producto escalar_: `Vector3.UP.dot(collision.get_normal()) > 0.1`. La normal de colisión es un vector 3D que es perpendicular al plano donde ocurrió la colisión. El _producto escalar_ nos permite compararlo con la dirección ascendente.

Con productos escalares, cuando el resultado es mayor que `0`, los dos vectores están en un ángulo de menos de 90 grados. Un valor mayor que `0.1` nos indica que estamos aproximadamente por encima del monstruo.

Después de manejar la lógica de aplastamiento y rebote, finalizamos el bucle de manera anticipada mediante la declaración `break` para evitar más llamadas duplicadas a `mob.squash()`, que de otra manera podrían resultar en errores no deseados, como contar el puntaje varias veces para una muerte.

Estamos llamando a una función indefinida, `mob.squash()`, por lo que tenemos que agregarla a la clase **Mob**.

Abre el script `mob.gd` haciendo doble clic en él en el dock _FileSystem_. En la parte superior del script, queremos definir una nueva señal llamada `squashed`. Y en la parte inferior, puedes agregar la función `squash`, donde emitimos la señal y destruimos al mob.

```
# Señal emitida cuando el jugador salta sobre el mob.
signal squashed

# ...


func squash():
	squashed.emit()
	queue_free()
```

Usaremos la señal para agregar puntos al puntaje en la próxima lección.

Con eso, deberías poder matar monstruos saltando sobre ellos. Puedes presionar `F5` para probar el juego y configurar `main.tscn` como la escena principal de tu proyecto.

Sin embargo, el jugador no morirá todavía. Trabajaremos en eso en la próxima parte.

### Muerte del jugador

Podemos matar enemigos saltando sobre ellos, pero el jugador no puede morir. Vamos a solucionar esto.

Queremos detectar si un enemigo nos golpea de forma diferente a si lo aplastamos. Queremos que el jugador muera cuando se mueve por el suelo, pero no si está en el aire. Podríamos usar matemáticas vectoriales para distinguir los dos tipos de colisiones. Sin embargo, en su lugar, usaremos un nodo [Area3D](https://docs.godotengine.org/en/stable/classes/class_area3d.html#class-area3d), que funciona bien para las _hitboxes (zonas de impacto)_.

#### Hitbox con el nodo Area

Vuelve a la escena `player.tscn` y agrega un nuevo nodo hijo **Area3D**. Nómbralo `MobDetector`. Agrega un nodo **CollisionShape3D** como hijo de este.

![01-killing-player](./img/01-killing-player.webp)

En **Inspector**, asígnale un `New CylinderShape`.

![02-killing-player](./img/02-killing-player.webp)

Aquí tienes un truco que puedes usar para que las colisiones solo ocurran cuando el jugador esté en el suelo o cerca de él. Puedes reducir la altura del cilindro y moverlo hasta la parte superior del personaje. De esta manera, cuando el jugador salte, la forma estará demasiado alta para que los enemigos colisionen con ella.

![03.cylinder_in_editor](./img/03.cylinder_in_editor.png)

También quieres que el cilindro sea más ancho que la esfera. De esta manera, el jugador recibe el golpe antes de chocar y ser empujado hacia la parte superior del cubo de colisión del mob.

Cuanto más ancho sea el cilindro, más fácilmente morirá el jugador.

A continuación, selecciona el nodo `MobDetector` nuevamente y, en _Inspector_, **desactiva** su propiedad _Monitorable_. Esto hace que otros nodos de física no puedan detectar el área. La propiedad complementaria _Monitoring_ le permite detectar colisiones. Luego, elimina _Collision -> Layer_ y establece _Mask_ en la capa "enemies".

![04.mob_detector_properties](./img/04.mob_detector_properties.webp)

Cuando las áreas detectan una colisión, emiten señales. Vamos a conectar una al nodo `Player`. Selecciona `MobDetector` y ve a la pestaña _Nodo_ de _Inspector_, haz doble clic en la señal `body_entered` y conéctala a `Player`.

![05-killing-player](./img/05-killing-player.webp)

_MobDetector_ emitirá `body_entered` cuando un nodo **CharacterBody3D** o **RigidBody3D** ingrese en él. Ya que solo enmascara las capas físicas de los "enemies", solo detectará los nodos `Mob`.

En cuanto al código, vamos a hacer dos cosas: emitir una señal que luego usaremos para terminar el juego y destruir al jugador. Podemos envolver estas operaciones en una función `die()` que nos ayude a poner una etiqueta descriptiva en el código.

```
# Se emite cuando el jugador es golpeado por un mob.
# Pon esto en la parte superior del script.
signal hit


# Y esta función en la parte inferior.
func die():
	hit.emit()
	queue_free()


func _on_mob_detector_body_entered(body):
	die()
```

#### Finalización del juego

Podemos usar la señal `hit` de `Player` para finalizar el juego. Todo lo que tenemos que hacer es conectarlo al nodo `Main` y, como consecuencia, detener el `MobTimer`.

Abre `main.tscn`, selecciona el nodo `Player` y, en el dock _Node_, conecta su señal `hit` al nodo `Main`:

![06-killing-player](./img/06-killing-player.webp)

Obtén el temporizador y deténlo en la función `_on_player_hit()`.

```
func _on_player_hit():
	$MobTimer.stop()
```

Si pruebas el juego ahora, los mobs dejarán de aparecer cuando mueras y los que queden dejarán de aparecer en la pantalla.

Observa también que el juego ya no se bloquea ni muestra un error cuando el jugador muere. Como estamos deteniendo el _MobTimer_, ya no activa la función `_on_mob_timer_timeout()`.

Observa también que la colisión del enemigo con el jugador y su muerte depende del tamaño y la posición de las _formas de colisión_ de `Player` y `Mob`. Es posible que tengas que moverlos y cambiarles el tamaño para lograr una sensación de juego más realista.

Ahora puedes felicitarte: creaste un prototipo de juego en 3D completo, aunque todavía falte pulirlo.

A partir de aquí, agregaremos una puntuación, la opción de volver a intentar el juego y verás cómo puedes hacer que el juego se sienta mucho más vivo con animaciones minimalistas.

#### Punto de control del código

A continuación se muestran los scripts completos para los nodos `Main`, `Mob` y `Player`, como referencia. Puede usarlos para comparar y verificar su código.

Empezando con `main.gd`:

```
extends Node

@export var mob_scene: PackedScene


func _on_mob_timer_timeout():
	# Crea una nueva instancia de la escena Mob.
	var mob = mob_scene.instantiate()

	# Elige una ubicación aleatoria en SpawnPath.
	# Almacenamos la referencia al nodo SpawnLocation.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# Y le damos un desplazamiento aleatorio.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)

	# Genera el mob agregándolo a la escena Main.
	add_child(mob)

func _on_player_hit():
	$MobTimer.stop()
```

El siguiente es `mob.gd`:

```
extends CharacterBody3D

# Velocidad mínima del mob en metros por segundo.
@export var min_speed = 10
# Velocidad máxima del mob en metros por segundo.
@export var max_speed = 18

# Emitida cuando el jugador salta sobre el mob.
signal squashed

func _physics_process(_delta):
	move_and_slide()

# Esta función será llamada desde la escena Main.
func initialize(start_position, player_position):
	# Posicionamos al mob al colocarlo en start_position
	# y lo rotamos hacia player_position, de modo que mire al jugador.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# Rotamos este mob aleatoriamente dentro de un rango de -45 y +45 grados,
	# para que no se mueva directamente hacia el jugador.
	rotate_y(randf_range(-PI / 4, PI / 4))

	# Calculamos una velocidad aleatoria (entero).
	var random_speed = randi_range(min_speed, max_speed)
	# Calculamos una velocidad hacia adelante que representa la velocidad.
	velocity = Vector3.FORWARD * random_speed
	# Luego rotamos el vector de velocidad en función de la rotación Y del mob
	# para moverlo en la dirección en la que mira el mismo.
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()

func squash():
	squashed.emit()
	queue_free() # Destruye este nodo
```

Por último, el script más largo, `player.gd`:

```
extends CharacterBody3D

signal hit

# Qué tan rápido se mueve el jugador en metros por segundo.
@export var speed = 14
# La aceleración de caída cuando está en el aire, en metros por segundo al cuadrado.
@export var fall_acceleration = 75
# Impulso vertical aplicado al personaje al saltar, en metros por segundo.
@export var jump_impulse = 20
# Impulso vertical aplicado al personaje al rebotar sobre un mob
# en metros por segundo.
@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	# Creamos una variable local para almacenar la dirección del input.
	var direction = Vector3.ZERO

	# Comprobamos cada entrada de movimiento y consecuentemente actualizamos la dirección.
	if Input.is_action_pressed("move_right"):
		direction.x = direction.x + 1
	if Input.is_action_pressed("move_left"):
		direction.x = direction.x - 1
	if Input.is_action_pressed("move_back"):
		# Observa cómo trabajamos con los ejes x y z del vector.
		# En 3D, el plano XZ es el plano del suelo.
		direction.z = direction.z + 1
	if Input.is_action_pressed("move_forward"):
		direction.z = direction.z - 1

	# Evitamos el movimiento diagonal rápido
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)

	# Velocidad en el suelo
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Velocidad vertical
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Salto
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse

	# Iteramos a través de todas las colisiones que ocurrieron en este fotograma
	# en lenguaje C sería: for(int i = 0; i < collisions.Count; i++)
	for index in range(get_slide_collision_count()):
		# Obtenemos una de las colisiones con el jugador
		var collision = get_slide_collision(index)

		# Si la colisión es con el suelo:
		if collision.get_collider() == null:
			continue

		# Si colisión es con un mob:
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# Comprobamos que lo estemos golpeando desde arriba:
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				# Si es así, lo aplastamos y rebotamos
				mob.squash()
				target_velocity.y = bounce_impulse
				# Prevenimos más llamadas duplicadas
				break

	# Movemos el personaje
	velocity = target_velocity
	move_and_slide()

# Y esta función al final.
func die():
	hit.emit()
	queue_free()

func _on_mob_detector_body_entered(body):
	die()
```

Nos vemos en la próxima lección para agregar la puntuación y la opción de reintentar.

### Puntuación y repetición

En esta parte, agregaremos la puntuación, la reproducción de música y la capacidad de reiniciar el juego.

Debemos llevar un registro de la puntuación actual en una variable y mostrarla en la pantalla mediante una interfaz mínima. Para ello, usaremos una _etiqueta de texto_.

En la escena `Main`, agregue un nuevo nodo hijo [**Control**](https://docs.godotengine.org/en/stable/classes/class_control.html#class-control) a `Main` y nómbrelo `UserInterface`. Asegúrese de estar en la pantalla 2D, donde puede editar su interfaz de usuario (IU).

Agregue un nodo **Label** y nómbrelo `ScoreLabel`:

![01-score-replay](./img/01-score-replay.webp)

En **Inspector**, configure _Text_ del campo _Label_ con un placeholder como: `Score: 0`.

![02-score-replay](./img/02-score-replay.webp)

Además, de forma predeterminada el texto es blanco como lo es el fondo de nuestro juego. Necesitamos cambiar su color para verlo en tiempo de ejecución.

Desplázate hacia abajo hasta _Theme Overrides_, expande _Colors_ y habilita _Font Color_ para teñir el texto de negro (que contrasta bien con la escena 3D blanca);

![03-score-replay](./img/03-score-replay.webp)

Por último, haz clic y arrastra el texto en la ventana gráfica para alejarlo de la esquina superior izquierda.

![04-score-replay](./img/04-score-replay.webp)

El nodo `UserInterface` nos permite agrupar nuestra IU en una rama del árbol de la escena y usar un recurso de tema que se propagará a todos sus hijos. Lo usaremos para configurar la fuente tipográfica de nuestro juego.

#### Creación de un tema de IU

Una vez más, seleccione el nodo `UserInterface`. En **Inspector**, cree un nuevo recurso de tema en _Theme > Theme_.

![05-score-replay](./img/05-score-replay.webp)

Haga clic en él para abrir el editor de temas en el panel inferior. Le ofrece una vista previa de cómo se verán todos los widgets de IU integrados con su recurso de tema.

![06-score-replay](./img/06-score-replay.webp)

De manera predeterminada, un tema solo tiene algunas propiedades: _Default Base Scale, Default Font and Default Font Size_.

> **Consulte también:**
>
> Puede agregar más propiedades al recurso de tema para diseñar interfaces de usuario complejas, pero eso está fuera del alcance de esta serie. Para obtener más información sobre la creación y edición de temas, consulte [Introducción a la personalización de GUI](https://docs.godotengine.org/en/stable/tutorials/ui/gui_skinning.html#doc-gui-skinning).

La propiedad _Default Font_ espera un archivo de fuente como los que tiene en su computadora. Dos formatos de archivo de fuente comunes son TrueType Font (TTF) y OpenType Font (OTF).

En el dock _FileSystem_, expanda el directorio `fonts` y haga clic y arrastre el archivo `Montserrat-Medium.ttf` que incluimos en el proyecto hacia _Default Font_. El texto volverá a aparecer en la vista previa del tema.

El texto es un poco pequeño. Establezca el _Default Font Size_ en `22` píxeles para aumentar el tamaño del texto.

![07-score-replay](./img/07-score-replay.webp)

#### Seguimiento de la puntuación

Trabajemos ahora en la puntuación. Adjunte un nuevo script a `ScoreLabel` y defina la variable `score`.

```
extends Label

var score = 0
```

La puntuación debería aumentar en `1` cada vez que aplastemos un mob. Podemos usar su señal `squashed` para saber cuándo sucede eso. Sin embargo, debido a que instanciamos monstruos desde el código, no podemos conectar la señal del mob a `ScoreLabel` a través del editor.

En cambio, tenemos que hacer la conexión desde el código cada vez que generemos un mob.

Abra el script `main.gd`. Si aún está abierto, puede hacer clic en su nombre en la columna izquierda del editor de scripts.

![08-score-replay](./img/08-score-replay.webp)

Alternativamente, puede hacer doble clic en el archivo `main.gd` en el dock _FileSystem_.

En la parte inferior de la función `_on_mob_timer_timeout()`, agregue la siguiente línea:

```
func _on_mob_timer_timeout():
	#...
	# Conectamos el mob a la etiqueta de puntuación para actualizar la puntuación al aplastar una.
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())
```
Esta línea significa que cuando el mob emite la señal `squashed`, el nodo `ScoreLabel` la recibirá y llamará a la función `_on_mob_squashed()`.

Regrese al script `score_label.gd` para definir la función callback `_on_mob_squashed()`.

Allí, incrementamos la puntuación y actualizamos el texto mostrado.

```
func _on_mob_squashed():
	score += 1
	text = "Score: %s" % score
```

La segunda línea usa el valor de la variable `score` para reemplazar el placeholder `%s`. Al utilizar esta función, Godot convierte automáticamente los valores en cadena de texto, lo que resulta práctico cuando se genera texto en etiquetas o cuando se utiliza la función `print()`.

> **Consulte también:**
>
> Puede obtener más información sobre el formato de cadenas de texto aquí: [formato de cadenas de texto GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html#doc-gdscript-printf).

Ahora puede jugar y aplastar a algunos enemigos para ver cómo aumenta la puntuación.

![09-score-replay](./img/09-score-replay.webp)

> **Nota:**
>
> En un juego complejo, es factible que desee separar por completo su interfaz de usuario del mundo del juego. En ese caso, no llevaría un registro de la puntuación en una etiqueta. En cambio, es posible que desee almacenarla en un objeto separado y dedicado. Pero cuando se crea un prototipo o cuando su proyecto es simple, está bien mantener su código simple. La programación es siempre un acto de equilibrio.

#### Reintentar el juego

Ahora agregaremos la posibilidad de volver a jugar después de morir. Cuando el jugador muera, mostraremos un mensaje en la pantalla y esperaremos la entrada.

Regrese a la escena `main.tscn`, seleccione el nodo **UserInterface**, agregue un nodo hijo [**ColorRect**](https://docs.godotengine.org/en/stable/classes/class_colorrect.html#class-colorrect) y nómbrelo `Retry`. Este nodo llena un rectángulo con un color uniforme y servirá como una capa superpuesta para oscurecer la pantalla.

Para que se extienda por toda la ventana gráfica, puede usar el menú _Anchor Preset_ en la barra de herramientas.

![10-score-replay](./img/10-score-replay.webp)

Ábralo y aplique el comando **Full Rect**.

![11-score-replay](./img/11-score-replay.webp)

No sucede nada. Bueno, casi nada; solo los cuatro pines verdes se mueven a las esquinas del cuadro de selección.

![12-score-replay](./img/12-score-replay.webp)

Esto se debe a que los nodos de la interfaz de usuario (todos los que tienen un ícono verde) funcionan con anclas y márgenes relativos al cuadro delimitador de su padre. Aquí, el nodo `UserInterface` tiene un tamaño pequeño y `Retry` está limitado por él.

Selecciona `UserInterface` y aplícale también _Anchor Preset > Full Rect_. El nodo `Retry` debería abarcar ahora toda la ventana gráfica.

Cambiemos su color para que oscurezca el área de juego. Selecciona `Retry` y en _Inspector_, establece _Color_ en algo oscuro y transparente. Para ello, en el selector de color, arrastra el _control deslizante A_ hacia la izquierda a un valor aproximado en `96`. Controla el canal _Alfa_ del color, es decir, su opacidad/transparencia:

![13-score-replay](./img/13-score-replay.webp)

A continuación, añade una [**Label**](https://docs.godotengine.org/en/stable/classes/class_label.html#class-label) como hijo de `Retry` y en _Text_ ingresa `Press Enter to retry`. Para moverla y anclarla en el centro de la pantalla, aplícale `Anchor Preset > Center`:

![14-score-replay](./img/14-score-replay.webp)

##### Codificación de la opción de reintento

Ahora podemos dirigirnos al código para mostrar y ocultar el nodo `Retry` de acuerdo a si el jugador muere o decide volver a jugar.

Abre el script `main.gd`. Primero, queremos ocultar la superposición al comienzo del juego. Agregue esta línea a la función `_ready()`.

```
func _ready():
	$UserInterface/Retry.hide()
```

Luego, cuando el jugador recibe un golpe, mostramos la superposición.

```
func _on_player_hit():
	#...
	$UserInterface/Retry.show()
```

Finalmente, cuando el nodo `Retry` está visible, necesitamos escuchar el input del jugador y reiniciar el juego si presiona _Enter_. Para hacer esto, usamos el callback incorporado `_unhandled_input()`, que se activa con cualquier entrada.

Si el jugador presionó la acción de entrada predefinida `ui_accept` y `Retry` está visible, recargamos la escena actual.

```
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# Esto reinicia la escena actual.
		get_tree().reload_current_scene()
```

La función `get_tree()` nos da acceso al objeto global **SceneTree**, lo que nos permite recargar y reiniciar la escena actual.

#### Añadir música

Para añadir música que se reproduzca de forma continua en segundo plano, vamos a utilizar otra función de Godot: las [**autoloads**](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html#doc-singletons-autoload) (cargas automáticas).

Para reproducir audio, todo lo que tienes que hacer es añadir un nodo [**AudioStreamPlayer**](https://docs.godotengine.org/en/stable/classes/class_audiostreamplayer.html#class-audiostreamplayer) a tu escena y adjuntarle un archivo de audio. Cuando empiezas la escena, se puede reproducir automáticamente. Sin embargo, cuando vuelves a cargar la escena como cuando reintemos el juego, los nodos de audio también se restablecen y la música vuelve a empezar desde el principio.

Puedes utilizar la función _autoload_ para que Godot cargue un nodo o una escena automáticamente al comienzo del juego, fuera de la escena actual. También puedes utilizarla para crear objetos accesibles globalmente.

Crea una nueva escena yendo al menú _Scene_ y haciendo clic en _New Scene_ o utilizando el icono `+` junto a la escena abierta actualmente.

![15-score-replay](./img/15-score-replay.webp)

Haz clic en el botón _Other Node_ y crea un nodo **AudioStreamPlayer**. Cámbiale el nombre a `MusicPlayer`.

![16-score-replay](./img/16-score-replay.webp)

Incluimos una banda sonora musical en el directorio `art/`: `House In a Forest Loop.ogg`. Haz clic y arrástralo a la propiedad _Stream_ en _Inspector_. Además, activa _Autoplay_ para que la música se reproduzca automáticamente al inicio del juego.

![17-score-replay](./img/17-score-replay.webp)

Guarda la escena como `music_player.tscn`.

Ahora tenemos que registrarla como _autoload_. Dirígete al menú _Project > Project Settings…_ y haz clic en la pestaña _Globals > Autoload_.

En el campo _Path_, debes ingresar la ruta a tu escena. Haz clic en el ícono de la carpeta para abrir el explorador de archivos y haz doble clic en `music_player.tscn`. Luego, haz clic en el botón _Add_ a la derecha para registrar el nodo.

![18-score-replay](./img/18-score-replay.webp)

`music_player.tscn` ahora se carga en cualquier escena que abras o juegues. Entonces, si ejecutas el juego ahora, la música se reproducirá automáticamente en cualquier escena.

Antes de terminar esta lección, veremos rápidamente cómo funciona _autoload_ en profundidad. Cuando ejecutas el juego, tu panel _Scene_ cambia para darte dos pestañas: _Remote_ y _Local_.

![19-score-replay](./img/19-score-replay.webp)

La pestaña _Remote_ te permite visualizar el árbol de nodos de tu juego en ejecución. Allí, verás el nodo _Main_ y todo lo que contiene dicha escena, y en la parte inferior los mobs instanciados.

![20-score-replay](./img/20-score-replay.webp)

En la parte superior está _MusicPlayer_ "autocargado" y un nodo _root_, que es la ventana gráfica de tu juego.

Y eso es todo por esta lección. En la siguiente parte, agregaremos una animación para que el juego se vea y se sienta mucho mejor.

Aquí está el script `main.gd` completo para referencia:

```
extends Node

@export var mob_scene: PackedScene

func _ready():
	$UserInterface/Retry.hide()


func _on_mob_timer_timeout():
	# Crea una nueva instancia de la escena Mob.
	var mob = mob_scene.instantiate()

	# Elige una ubicación aleatoria en SpawnPath.
	# Almacenamos la referencia al nodo SpawnLocation.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# Y le damos un desplazamiento aleatorio.
	mob_spawn_location.progress_ratio = randf()

	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)

	# Genera el mob agregándolo a la escena Main.
	add_child(mob)

	# Conectamos el mob a la etiqueta de puntuación para actualizar la puntuación al aplastar una.
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())

func _on_player_hit():
	$MobTimer.stop()
	$UserInterface/Retry.show()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# Esto reinicia la escena actual.
		get_tree().reload_current_scene()
```

### Animación de personajes

En esta última lección, utilizaremos las herramientas integradas de animación  de Godot para hacer que nuestros personajes floten y se agiten. Aprenderás a diseñar animaciones en el editor y a usar código para que tu juego parezca más vivo.

![01-character-animation](./img/01-character-animation.webp)

Comenzaremos con una introducción al uso del editor de animación.

#### Uso del editor de animación

El motor incluye herramientas para crear animaciones en el editor. Luego, puedes usar el código para reproducirlas y controlarlas en tiempo de ejecución.

Vamos a abrir la escena del jugador: selecciona el nodo `Player` y agrega un nodo [**AnimationPlayer**](https://docs.godotengine.org/en/stable/classes/class_animationplayer.html#class-animationplayer).

El dock _Animation_ aparece en el panel inferior.

![02-character-animation](./img/02-character-animation.webp)

Tiene una _barra de herramientas_ y el _menú desplegable de animación_ en la parte superior, un _editor de pistas_ en el medio que actualmente está vacío y opciones de _filtro_, _ajuste_ y _zoom_ en la parte inferior.

Vamos a crear una animación. Haz clic en _Animation > New_:

![03-character-animation](./img/03-character-animation.webp)

Nombra la animación `float`:

![04-character-animation](./img/04-character-animation.webp)

Una vez que hayas creado la animación, aparecerá la _línea de tiempo_ con números que representan el tiempo en segundos.

![05-character-animation](./img/05-character-animation.webp)

Queremos que la animación comience a reproducirse automáticamente al comienzo del juego. Además, debería repetirse.

Para ello, puedes hacer clic en el botón _reproducción automática_ (Autoplay: ![autoplay_button](./img/autoplay_button.webp)) en la barra de herramientas de animación, y clic en las _flechas de repetición_, respectivamente.

![06-character-animation](./img/06-character-animation.webp)

También puedes pinnear (fijar) el editor de animación haciendo clic en el icono _pin_ en la parte superior derecha. Esto evita que se pliegue cuando haces clic en la ventana gráfica y deseleccionas los nodos.

![07-character-animation](./img/07-character-animation.webp)

Establece la _duración de la animación_ en `1.2` segundos en la parte superior derecha del dock.

![08-character-animation](./img/08-character-animation.webp)

Deberías ver que la cinta gris se ensancha un poco. Te muestra el inicio y el final de tu animación y la línea azul vertical es tu _cursor de tiempo_.

![09-character-animation](./img/09-character-animation.webp)

Puedes hacer clic y arrastrar el _control deslizante_ en la parte inferior derecha para acercar o alejar la línea de tiempo.

![10-character-animation](./img/10-character-animation.webp)

#### La animación float

Con el nodo [**AnimationPlayer**](https://docs.godotengine.org/en/stable/classes/class_animationplayer.html#class-animationplayer), puedes animar la mayoría de las propiedades en tantos nodos como necesites. Observa el icono con forma de _llave_ junto a las propiedades en _Inspector_. Puedes hacer clic en cualquiera de ellas para crear un _keyframe (fotograma clave)_, un par de _tiempo_ y _valor_ para la propiedad correspondiente. El _keyframe_ se inserta donde está el _cursor de tiempo_ en la línea de tiempo.

Insertemos nuestras primeras "llaves". Aquí, animaremos tanto la _posición_ como la _rotación_ del nodo `Character`.

Selecciona `Character` y en _Inspector_ expande la sección _Transform_. Haz clic en los iconos con forma de llave junto a _Position_ y _Rotation_.

![11-character-animation](./img/11-character-animation.webp)

![12-character-animation](./img/12-character-animation.webp)

Para este tutorial, solo crea **RESET Track(s)** que es la opción predeterminada.

En el editor aparecen dos pistas con un icono con forma de _diamante_ que representa cada _keyframe_.

![13-character-animation](./img/13-character-animation.webp)

Puedes hacer clic y arrastrar los diamantes para moverlos en el tiempo. Mueve el keyframe _position_ a `0.3` segundos y el keyframe `rotation` a `0.1` segundos.

![14-character-animation](./img/14-character-animation.webp)

Mueva el _cursor de tiempo_ a `0.5` segundos haciendo clic y arrastrando en la línea de tiempo gris.

![15-character-animation](./img/15-character-animation.webp)

En _Inspector_, establezca el _eje Y de Position_ en `0.65` metros y el _eje X de Rotation_ en `8`.

Si no ve las propiedades en el panel _Inspector_, primero haga clic en el nodo `Character` nuevamente en el dock _Scene_.

![16-character-animation](./img/16-character-animation.webp)

Cree un _keyframe_ para ambas propiedades:

![17-character-animation](./img/17-character-animation.webp)

Ahora, mueva el _keyframe_ de _Position_ a `0.7` segundos arrastrándolo en la línea de tiempo.

![18-character-animation](./img/18-character-animation.webp)

> **Nota:**
>
> Una lección sobre los _principios de la animación_ está fuera del alcance de este tutorial. Solo tenga en cuenta que no es conveniente hacer coincidir en tiempo y espacio todo cambio de propiedad de animación. Los animadores juegan con el _timing_ y el _spacing_, dos principios básicos de la animación. Es conveniente compensar y contrastar el movimiento de su personaje para que parezca vivo.

Mueva el _cursor de tiempo_ al final de la animación, a `1.2` segundos. Establezca la _Position Y_ en aproximadamente `0.35` y la _Rotation X_ en `-9` grados. Una vez más, cree un _keyframe_ para ambas propiedades.

![19-character-animation](./img/19-character-animation.webp)

Puede obtener una vista previa del resultado haciendo clic en el botón de reproducción o presionando `Shift + D`. Haga clic en el botón de detención o presione `S` para detener la reproducción.

![20-character-animation](./img/20-character-animation.webp)

Puede ver que el motor interpola entre sus _keyframes_ para producir una animación continua. Sin embargo, en este momento, el movimiento se siente muy robótico. Esto se debe a que la interpolación predeterminada es _lineal_, lo que provoca transiciones constantes, a diferencia de cómo se mueven los seres vivos en el mundo real.

Podemos controlar la transición entre _keyframes_ mediante _easing curves (curvas de suavizado)_.

Haga clic y arrastre alrededor de los dos primeros _keyframes_ en la línea de tiempo para seleccionarlas.

![21-character-animation](./img/21-character-animation.webp)

Puede editar simultáneamente las propiedades de ambas claves en _Inspector_, donde puede ver una propiedad _Easing_.

![22-character-animation](./img/22-character-animation.webp)

Haga clic y arrastre sobre la _curva_, tirándola hacia la izquierda. Esto hará que la transición sea más lenta, es decir, que la transición sea rápida al principio y se ralentice a medida que el cursor de tiempo llega al siguiente fotograma clave.

![23-character-animation](./img/23-character-animation.webp)

Reproduce la animación nuevamente para ver la diferencia. La primera mitad ya debería verse un rebote más acentuado.

Aplica una _easy-out (transición más lenta)_ al segundo keyframe en la pista de _rotación_.

![24-character-animation](./img/24-character-animation.webp)

Haz lo opuesto para el segundo keyframe de _posición_, arrastrándolo hacia la derecha.

![25-character-animation](./img/25-character-animation.webp)

Tu animación debería verse así:

![26-character-animation](./img/26-character-animation.gif)

Nota

Las animaciones actualizan las propiedades de los nodos animados en cada fotograma, anulando los valores iniciales. Si animáramos directamente el nodo _Player_, nos impediría moverlo en el código. Aquí es donde el nodo _Pivot_ resulta útil: aunque animamos _Character_, aún podemos mover y rotar el _Pivot_ y los cambios de capa sobre la animación en un script.

Si juegas, ¡la criatura del jugador ahora flotará!

Si la criatura está demasiado cerca del suelo, puedes mover `Pivot` hacia arriba para compensarla.

##### Controlar la animación en código

Podemos usar código para controlar la reproducción de la animación en función del input del jugador. Cambiemos la _velocidad de la animación_ cuando el personaje se mueve.

Abra el script de `Player` haciendo clic en el ícono del script que se encuentra junto a él.

![27-character-animation](./img/27-character-animation.webp)

En `_physics_process()`, después de la línea donde verificamos el vector `direction`, agregue el siguiente código:

```
func _physics_process(delta):
	#...
	if direction != Vector3.ZERO:
		#...
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1
```

Este código hace que cuando el jugador se mueva, aumentamos la velocidad de reproducción a `4`. Cuando se detenga, la restablezcamos a la normalidad que corresponde a `1`.

Mencionamos que `Pivot` podría superponer transformaciones sobre la animación. Podemos hacer que el personaje se arquee cuando salte usando la siguiente línea de código. Agréguela al final de `_physics_process()`:

```
func _physics_process(delta):
	#...
	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse
```

#### Animación de los mobs

Aquí hay otro truco interesante con las animaciones en Godot: siempre que uses una estructura de nodos similar, puedes copiarlas en diferentes escenas.

Por ejemplo, tanto las escenas `Mob` como `Player` tienen un nodo `Pivot` y un nodo `Character`, por lo que podemos reutilizar animaciones entre ellas.

Abre la escena `Player`, selecciona el nodo **AnimationPlayer** y haz clic en _Animation > Manage Animations..._ Haz clic en el botón _Copy animation to clipboard_ (dos cuadrados pequeños) junto a la animación _float_. Haz clic en _OK_ para cerrar la ventana.

A continuación, abre `mob.tscn`, crea un nodo hijo [**AnimationPlayer**](https://docs.godotengine.org/en/stable/classes/class_animationplayer.html#class-animationplayer) y selecciónalo. Haz clic en **Animation > Manage Animations** y, a continuación, en **Add Library**. Deberías ver el mensaje _"Global library will be created"_. Deja el campo de texto en blanco y haz clic en _OK_. Haz clic en el icono _Paste_ (portapapeles) y debería aparecer en la ventana. Haz clic en _OK_Aceptar para cerrar la ventana.

A continuación, asegúrate de que el botón _reproducción automática_ (Autoplay: [autoplay_button](./img/autoplay_button.webp)) y las flechas de bucle (Animation looping) también estén activados en el editor de animación del panel inferior. Eso es todo; todos los _mobs_ reproducirán ahora la animación _float_.

Podemos cambiar la velocidad de reproducción en función de la _random_speed_ de la criatura. Abre el script de _Mob_ y al final de la función `initialize()`, agrega la siguiente línea:

```
func initialize(start_position, player_position):
	#...
	$AnimationPlayer.speed_scale = random_speed / min_speed
```

Y con eso, terminaste de codificar tu primer juego 3D completo.

**¡Felicitaciones!**

En la siguiente parte, recapitularemos rápidamente lo que aprendiste y te daremos algunos enlaces para que sigas aprendiendo más. Pero por ahora, aquí están los archivos `player.gd` y `mob.gd` completos para que puedas comparar tu código con ellos.

Aquí está el script _Player_:

```
extends CharacterBody3D

signal hit

# Qué tan rápido se mueve el jugador en metros por segundo.
@export var speed = 14
# La aceleración de caída cuando está en el aire, en metros por segundo al cuadrado.
@export var fall_acceleration = 75
# Impulso vertical aplicado al personaje al saltar, en metros por segundo.
@export var jump_impulse = 20
# Impulso vertical aplicado al personaje al rebotar sobre un mob
# en metros por segundo.
@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO


func _physics_process(delta):
	# Creamos una variable local para almacenar la dirección del input.
	var direction = Vector3.ZERO

	# Comprobamos cada entrada de movimiento y consecuentemente actualizamos la dirección.
	if Input.is_action_pressed("move_right"):
		direction.x = direction.x + 1
	if Input.is_action_pressed("move_left"):
		direction.x = direction.x - 1
	if Input.is_action_pressed("move_back"):
		# Observa cómo trabajamos con los ejes x y z del vector.
		# En 3D, el plano XZ es el plano del suelo.
		direction.z = direction.z + 1
	if Input.is_action_pressed("move_forward"):
		direction.z = direction.z - 1

	# Evitamos el movimiento diagonal rápido
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction,Vector3.UP)
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1

	# Velocidad en el suelo
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Velocidad vertical
	if not is_on_floor(): # If in the air, fall towards the floor
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Salto
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse

	# Iteramos a través de todas las colisiones que ocurrieron en este fotograma
	# en lenguaje C sería: for(int i = 0; i < collisions.Count; i++)
	for index in range(get_slide_collision_count()):
		# Obtenemos una de las colisiones con el jugador
		var collision = get_slide_collision(index)

		# Si la colisión es con el suelo:
		if collision.get_collider() == null:
			continue

		# Si colisión es con un mob:
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# Comprobamos que lo estemos golpeando desde arriba:
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				# Si es así, lo aplastamos y rebotamos.
				mob.squash()
				target_velocity.y = bounce_impulse
				# Prevenimos más llamadas duplicadas.
				break

	# Movemos el personaje
	velocity = target_velocity
	move_and_slide()

	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse

# Y esta función al final.
func die():
	hit.emit()
	queue_free()

func _on_mob_detector_body_entered(body):
	die()
```

Y el script de _Mob_:

```
extends CharacterBody3D

# Velocidad mínima del mob en metros por segundo.
@export var min_speed = 10
# Velocidad máxima del mob en metros por segundo.
@export var max_speed = 18

# Emitida cuando el jugador salta sobre el mob.
signal squashed

func _physics_process(_delta):
	move_and_slide()

# Esta función será llamada desde la escena Main.
func initialize(start_position, player_position):
	# Posicionamos al mob al colocarlo en start_position
	# y lo rotamos hacia player_position, de modo que mire al jugador.
	look_at_from_position(start_position, player_position, Vector3.UP)
	# Rotamos este mob aleatoriamente dentro de un rango de -45 y +45 grados,
	# para que no se mueva directamente hacia el jugador.
	rotate_y(randf_range(-PI / 4, PI / 4))

	# Calculamos una velocidad aleatoria (entero).
	var random_speed = randi_range(min_speed, max_speed)
	# Calculamos una velocidad hacia adelante que representa la velocidad.
	velocity = Vector3.FORWARD * random_speed
	# Luego rotamos el vector de velocidad en función de la rotación Y del mob
	# para moverlo en la dirección en la que mira el mismo.
	velocity = velocity.rotated(Vector3.UP, rotation.y)

	$AnimationPlayer.speed_scale = random_speed / min_speed

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()

func squash():
	squashed.emit()
	queue_free() # Destroy this node
```

### Más allá

Puedes darte una palmadita en la espalda por haber completado tu primer juego en 3D con Godot.

En esta serie, repasamos una amplia gama de técnicas y funciones del editor. Esperamos que hayas visto lo intuitivo que puede ser el sistema de escenas de Godot y hayas aprendido algunos trucos que puedes aplicar en tus proyectos.

Pero solo hemos arañado la superficie: Godot tiene mucho más para ofrecerte para ahorrar tiempo en la creación de juegos. Y puedes aprender todo eso explorando la documentación.

¿Por dónde deberías empezar? A continuación, encontrarás algunas páginas para comenzar a explorar y desarrollar lo que has aprendido hasta ahora.

Pero antes de eso, aquí tienes un enlace para descargar una versión completa del proyecto: https://github.com/godotengine/godot-demo-projects/releases.

#### Explorando el manual

El manual es tu aliado siempre que tengas una duda o sientas curiosidad por una característica. No contiene tutoriales sobre géneros o mecánicas de juego específicos. En lugar de eso, explica cómo funciona Godot en general. En él, encontrarás información sobre 2D, 3D, física, renderizado y rendimiento, y mucho más.

Estas son las secciones que le recomendamos explorar a continuación:

1. Lea la sección [Scripting](https://docs.godotengine.org/en/stable/tutorials/scripting/index.html#toc-scripting-core-features) para aprender las características de programación esenciales que usará en cada proyecto.
2. Las secciones [3D](https://docs.godotengine.org/en/stable/tutorials/3d/index.html#toc-learn-features-3d) y [Physics](https://docs.godotengine.org/en/stable/tutorials/physics/index.html#toc-learn-features-physics) le enseñarán más sobre la creación de juegos 3D en el motor.
3. [Inputs](https://docs.godotengine.org/en/stable/tutorials/inputs/index.html#toc-learn-features-inputs) son otra parte importante para cualquier proyecto de juego.

Puedes comenzar con estas o, si lo prefiere, mirar el menú de la barra lateral a la izquierda y elegir sus opciones.

Esperamos que haya disfrutado de esta serie de tutoriales y estamos ansiosos por ver lo que logra usando Godot.

---

# SEGUIR EN: https://docs.godotengine.org/en/stable/getting_started/first_3d_game/08.score_and_replay.html

---

## Enlaces

[Harvard CS50’s Introduction to Computer Science](https://cs50.harvard.edu/x/2024/)

[Learning new features](https://docs.godotengine.org/en/stable/getting_started/introduction/learning_new_features.html#doc-learning-new-features)

https://gameprogrammingpatterns.com/

https://en.wikipedia.org/wiki/Game_mechanics

https://gamemechanicexplorer.com/

https://gamedesignskills.com/game-design/video-game-mechanics/

https://www.juegostudio.com/blog/the-ultimate-beginners-guide-to-game-mechanics

https://github.com/godotengine/godot-demo-projects/

https://github.com/godotengine/godot-demo-projects/releases

## Atajos de teclado (Shortcuts)

Project > Quit to Project List (`Ctrl + Shift + Q`)


## Convenciones

Los nombre de escenas se escriben con la primera letra en mayusculas y el resto en minusculas. Por ejemplo: `Player`

## Glosario
PCK: resource packs (PCK) files, with extension `.pck`


---

# Guía Profesional: Diferencias entre Area2D, StaticBody2D, CharacterBody2D y RigidBody2D en Godot Engine 4

En **Godot Engine 4**, los nodos físicos son esenciales para manejar interacciones y dinámicas dentro del motor de juegos. Esta guía profesional detalla las diferencias y los casos de uso más adecuados para los nodos `Area2D`, `StaticBody2D`, `CharacterBody2D` y `RigidBody2D`, enfocándose en cómo cada uno se comporta dentro del sistema de física 2D del motor.

---

## 1. `Area2D`

### Descripción
`Area2D` es un nodo que detecta la presencia de otros cuerpos físicos dentro de su espacio. No tiene interacción física directa (no aplica fuerzas ni colisiones reales), pero es ideal para detectar eventos, aplicar efectos y definir zonas de influencia.

### Propiedades Clave
- **Monitor**: Detecta cuerpos que ingresan o salen del área.
- **Gravity**: Puede modificar la gravedad local dentro del área.
- **Audio Bus Override**: Permite modificar propiedades de audio cuando un cuerpo entra en el área.

### Casos de Uso
- Zonas de daño (como trampas o campos de fuerza).
- Áreas de detección para activar eventos (como abrir puertas al entrar).
- Modificación de la gravedad en zonas específicas.
- Detectar la presencia de jugadores o enemigos.

### Ejemplo
```gdscript
func _on_area_entered(body):
    if body.is_in_group("Player"):
        print("Jugador ha ingresado al área")
```

---

## 2. `StaticBody2D`

### Descripción
`StaticBody2D` representa un cuerpo que no se mueve bajo las fuerzas físicas. Se utiliza para definir elementos sólidos en el mundo que interactúan con otros cuerpos, pero que no se ven afectados por las fuerzas externas.

### Propiedades Clave
- **Physics Material**: Permite ajustar propiedades como fricción y rebote.
- **Constant Linear/Angular Velocity**: Puede simular movimiento constante.

### Casos de Uso
- Paredes, pisos y plataformas.
- Obstáculos fijos en el entorno.
- Elementos que deben tener colisiones, pero no necesitan moverse.

### Ejemplo
```gdscript
var wall = StaticBody2D.new()
wall.position = Vector2(100, 200)
add_child(wall)
```

---

## 3. `CharacterBody2D`

### Descripción
`CharacterBody2D` es un nodo diseñado para manejar personajes controlados por el jugador o NPCs. Proporciona métodos especializados para controlar el movimiento y la detección de colisiones de manera predecible.

### Propiedades Clave
- **Velocity**: Controla la velocidad del cuerpo.
- **Move_and_slide()**: Método que facilita el movimiento y las colisiones contra superficies.
- **Move_and_collide()**: Método que detecta colisiones y proporciona información sobre ellas.

### Casos de Uso
- Personajes jugables.
- Enemigos o NPCs con rutas predefinidas.
- Entidades que requieren detección de superficies, como suelos o paredes.

### Ejemplo
```gdscript
func _physics_process(delta):
    var input_vector = Vector2.ZERO
    if Input.is_action_pressed("ui_right"):
        input_vector.x += 1
    if Input.is_action_pressed("ui_left"):
        input_vector.x -= 1

    velocity = move_and_slide(input_vector * speed)
```

---

## 4. `RigidBody2D`

### Descripción
`RigidBody2D` es un cuerpo dinámico que sigue las leyes de la física de manera realista. Se ve afectado por fuerzas, gravedad y colisiones, y puede ser controlado directamente o a través de fuerzas aplicadas.

### Modos de `RigidBody2D`
- **Rigid**: Modo predeterminado. Responde a fuerzas y colisiones de manera física.
- **Static**: Se comporta como un `StaticBody2D`.
- **Character**: Similar a `CharacterBody2D`, pero con algunas diferencias en la simulación física.
- **Kinematic**: Se comporta como un cuerpo cinemático que puede ser controlado manualmente.

### Propiedades Clave
- **Mass**: Determina la masa del cuerpo.
- **Friction**: Controla la cantidad de fricción aplicada en las superficies de contacto.
- **Bounce**: Controla el nivel de rebote del cuerpo.

### Casos de Uso
- Objetos físicos interactuables (como cajas, bolas, o proyectiles).
- Simulación de física realista en el entorno.
- Vehículos o máquinas físicas.

### Ejemplo
```gdscript
func _ready():
    var ball = RigidBody2D.new()
    ball.mass = 5
    ball.linear_velocity = Vector2(200, 0)
    add_child(ball)
```

---

## Comparación de los Nodos
| Nodo             | Movimiento | Colisiones | Fuerzas Físicas | Detección de Cuerpos |
|------------------|------------|------------|-----------------|----------------------|
| `Area2D`         | No         | No         | No              | Sí                   |
| `StaticBody2D`   | No         | Sí         | No              | No                   |
| `CharacterBody2D`| Sí         | Sí         | No (controlado) | No                   |
| `RigidBody2D`    | Sí         | Sí         | Sí              | No                   |

---

## Conclusión
Cada uno de estos nodos tiene un propósito específico en **Godot Engine 4**. Es importante seleccionar el nodo adecuado según la lógica del juego y el tipo de interacción que deseas lograr. Para entornos estáticos, usa `StaticBody2D`. Para personajes controlables, `CharacterBody2D` es la mejor opción. Si necesitas simulación física realista, opta por `RigidBody2D`, y para detección de áreas y activación de eventos, `Area2D` es ideal.

