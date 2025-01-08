# Godot Engine v4.3

## Índice
- [Capítulo 1. Introducción](#capítulo-1-introducción)
- [Capítulo 2. Paso a paso](#capítulo-2-paso-a-paso)
- [Capítulo 3. Tu primer juego 2D](#capítulo-3-tu-primer-juego-2d)

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

## Capítulo 2. Paso a paso

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

---

Seguir en: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html

## Capítulo 4. Tu primer juego 3D

#### El `Project Manager`

---

[Harvard CS50’s Introduction to Computer Science](https://cs50.harvard.edu/x/2024/)

[Learning new features](https://docs.godotengine.org/en/stable/getting_started/introduction/learning_new_features.html#doc-learning-new-features)

https://gameprogrammingpatterns.com/

https://en.wikipedia.org/wiki/Game_mechanics

https://gamemechanicexplorer.com/

https://gamedesignskills.com/game-design/video-game-mechanics/

https://www.juegostudio.com/blog/the-ultimate-beginners-guide-to-game-mechanics

