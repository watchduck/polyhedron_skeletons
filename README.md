This code was used to render
[images of polyhedra](https://commons.wikimedia.org/wiki/Category:Skeletons_of_polyhedra_(mostly_green_and_violet))
using [POV-Ray](https://en.wikipedia.org/wiki/POV-Ray). Most of them are 
[regular](https://en.wikipedia.org/wiki/Regular_polyhedron).<br>
They are shown in green or violet, depending on whether the edge in front is vertical or horizontal.

<table>
  <tr>
    <td>
      <a href="https://commons.wikimedia.org/wiki/File:Skeleton_20,_size_s.png">
        <img width="250" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Skeleton_20%2C_size_s.png/480px-Skeleton_20%2C_size_s.png">
      </a>
    </td>
    <td>
      <a href="https://commons.wikimedia.org/wiki/File:Skeleton_Gr12,_size_s.png">
        <img width="250" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Skeleton_Gr12%2C_size_s.png/480px-Skeleton_Gr12%2C_size_s.png">
      </a>
    </td>
    <td>
      <a href="https://commons.wikimedia.org/wiki/File:Skeleton_GrSt12,_size_s.png">
        <img width="250" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Skeleton_GrSt12%2C_size_s.png/480px-Skeleton_GrSt12%2C_size_s.png">
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://en.wikipedia.org/wiki/Regular_icosahedron">icosahedron</a><br>
      <a href="https://github.com/watchduck/polyhedron_skeletons/blob/master/views/skeletonic_20.tpl"><code>skeletonic_20.tpl</code></a>
    </td>
    <td>
      <a href="https://en.wikipedia.org/wiki/Great_dodecahedron">great dodecahedron</a><br>
      <a href="https://github.com/watchduck/polyhedron_skeletons/blob/master/views/skeletonic_Gr12.tpl"><code>skeletonic_Gr12.tpl</code></a>
    </td>
    <td>
      <a href="https://en.wikipedia.org/wiki/Great_stellated_dodecahedron">great stellated dodecahedron</a><br>
      <a href="https://github.com/watchduck/polyhedron_skeletons/blob/master/views/skeletonic_GrSt12.tpl"><code>skeletonic_GrSt12.tpl</code></a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://commons.wikimedia.org/wiki/File:Skeleton_12,_size_s.png">
        <img width="250" src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Skeleton_12%2C_size_s.png/480px-Skeleton_12%2C_size_s.png">
      </a>
    </td>
    <td>
      <a href="https://commons.wikimedia.org/wiki/File:Skeleton_St12,_size_s.png">
        <img width="250" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Skeleton_St12%2C_size_s.png/480px-Skeleton_St12%2C_size_s.png">
      </a>
    </td>
    <td>
      <a href="https://commons.wikimedia.org/wiki/File:Skeleton_Gr20,_size_s.png">
        <img width="250" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Skeleton_Gr20%2C_size_s.png/480px-Skeleton_Gr20%2C_size_s.png">
      </a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="https://en.wikipedia.org/wiki/Regular_dodecahedron">dodecahedron</a><br>
      <a href="https://github.com/watchduck/polyhedron_skeletons/blob/master/views/skeletonic_12.tpl"><code>skeletonic_12.tpl</code></a>
    </td>
    <td>
      <a href="https://en.wikipedia.org/wiki/Small_stellated_dodecahedron">stellated dodecahedron</a><br>
      <a href="https://github.com/watchduck/polyhedron_skeletons/blob/master/views/skeletonic_St12.tpl"><code>skeletonic_St12.tpl</code></a>
    </td>
    <td>
      <a href="https://en.wikipedia.org/wiki/Great_icosahedron">great icosahedron</a><br>
      <a href="https://github.com/watchduck/polyhedron_skeletons/blob/master/views/skeletonic_Gr20.tpl"><code>skeletonic_Gr20.tpl</code></a>
    </td>
  </tr>
</table>

The Python framework [Bottle](https://bottlepy.org/docs/dev/) is used to combine the templates in
[`views`](https://github.com/watchduck/polyhedron_skeletons/tree/master/views)
to POV-Ray files. Each of the images above is made with a single template, but compounds like
[this](https://commons.wikimedia.org/wiki/File:Skeleton_pair_Gr12_and_dual,_Petrie,_size_m,_thick.png)
use up to four.

The scenes are defined and rendered in [`app.py`](https://github.com/watchduck/polyhedron_skeletons/blob/master/app.py).

The orthographic projections from symmetry axes 
(like [this](https://commons.wikimedia.org/wiki/File:Skeleton_pair_12-20,_size_l,_5-fold.png)) 
are not made by putting the camera on the axis, but by putting the camera in front, and rotating the object accordingly.
(This way the light is consistent in all images.)<br>This is done in
[`final_rotation.inc`](https://github.com/watchduck/polyhedron_skeletons/blob/master/final_rotation.inc).
The `View` variable comes from `VARIABLES.inc`,<br> which is created before each render in 
[`app.py`](https://github.com/watchduck/polyhedron_skeletons/blob/master/app.py)
(compare [`variables.tpl`](https://github.com/watchduck/polyhedron_skeletons/blob/master/views/variables.tpl)).

The POV-Ray macros in [`pov_macros`](https://github.com/watchduck/polyhedron_skeletons/tree/master/pov_macros)
are described [here](https://github.com/watchduck/convex_polyhedra/tree/master/povray_includes).
