from bottle import template
from os import system


image_size = 2520

dict_of_scenes = {

    '4a': {'sym': 4, 'tpl': ['skeletonic_4a']},
    '4b': {'sym': 4, 'tpl': ['skeletonic_4b']},
    'pair_4-4': {'sym': 4, 'tpl': ['skeletonic_4a', 'skeletonic_4b']},
    'pair_4-4,_Petrie': {'sym': 4, 'tpl': ['skeletonic_4a', 'skeletonic_4b', 'petrie_4a', 'petrie_4b']},

    '4a,_Petrie,_stick': {'sym': 4, 'tpl': ['edges_4a', 'petrie_4a']},
    '4b,_Petrie,_stick': {'sym': 4, 'tpl': ['edges_4b', 'petrie_4b']},
    'pair_4-4,_Petrie,_stick': {'sym': 4, 'tpl': ['edges_4a', 'edges_4b', 'petrie_4a', 'petrie_4b']},


    '6': {'sym': 8, 'tpl': ['skeletonic_6']},
    '8': {'sym': 8, 'tpl': ['skeletonic_8']},
    'pair_6-8': {'sym': 8, 'tpl': ['skeletonic_6', 'skeletonic_8']},
    'pair_6-8,_Petrie': {'sym': 8, 'tpl': ['skeletonic_6', 'skeletonic_8', 'petrie_6', 'petrie_8']},

    '6,_Petrie,_stick': {'sym': 8, 'tpl': ['edges_6', 'petrie_6']},
    '8,_Petrie,_stick': {'sym': 8, 'tpl': ['edges_8', 'petrie_8']},
    'pair_6-8,_Petrie,_stick': {'sym': 8, 'tpl': ['edges_6', 'edges_8', 'petrie_6', 'petrie_8']},


    '12': {'sym': 20, 'tpl': ['skeletonic_12']},
    '20': {'sym': 20, 'tpl': ['skeletonic_20']},
    'pair_12-20': {'sym': 20, 'tpl': ['skeletonic_12', 'skeletonic_20']},
    'pair_12-20,_Petrie': {'sym': 20, 'tpl': ['skeletonic_12', 'petrie_12', 'skeletonic_20', 'petrie_20']},

    '12,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_12', 'petrie_12']},
    '20,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_20_Gr12', 'petrie_20']},
    'pair_12-20,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_12', 'petrie_12', 'edges_20_Gr12', 'petrie_20']},


    'Gr12': {'sym': 20, 'tpl': ['skeletonic_Gr12']},
    'St12': {'sym': 20, 'tpl': ['skeletonic_St12']},
    'pair_Gr12_and_dual': {'sym': 20, 'tpl': ['skeletonic_Gr12', 'skeletonic_St12']},
    'pair_Gr12_and_dual,_Petrie': {'sym': 20, 'tpl': ['skeletonic_Gr12', 'petrie_Gr12', 'skeletonic_St12', 'petrie_St12']},

    'Gr12,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_20_Gr12', 'petrie_Gr12']},
    'St12,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_Gr20_St12', 'petrie_St12']},
    'pair_Gr12_and_dual,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_20_Gr12', 'petrie_Gr12', 'edges_Gr20_St12', 'petrie_St12']},


    'Gr20': {'sym': 20, 'tpl': ['skeletonic_Gr20']},
    'GrSt12': {'sym': 20, 'tpl': ['skeletonic_GrSt12']},
    'pair_Gr20_and_dual': {'sym': 20, 'tpl': ['skeletonic_Gr20', 'skeletonic_GrSt12']},
    'pair_Gr20_and_dual,_Petrie': {'sym': 20, 'tpl': ['skeletonic_Gr20', 'petrie_Gr20', 'skeletonic_GrSt12', 'petrie_GrSt12']},

    'Gr20,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_Gr20_St12', 'petrie_Gr20']},
    'GrSt12,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_GrSt12', 'petrie_GrSt12']},
    'pair_Gr20_and_dual,_Petrie,_stick': {'sym': 20, 'tpl': ['edges_Gr20_St12', 'petrie_Gr20', 'edges_GrSt12', 'petrie_GrSt12']},


    'pair_12_and_greatening': {'sym': 20, 'tpl': ['skeletonic_12', 'skeletonic_Gr12']},
    'pair_20_and_greatening': {'sym': 20, 'tpl': ['skeletonic_20', 'skeletonic_Gr20']},
    'pair_St12_and_greatening': {'sym': 20, 'tpl': ['skeletonic_St12', 'skeletonic_GrSt12']},


    'rhombic_30_convex': {'sym': 20, 'tpl': ['rhombic_30_convex']},
    'rhombic_30_medial': {'sym': 20, 'tpl': ['rhombic_30_medial']},
    'rhombic_30_great': {'sym': 20, 'tpl': ['rhombic_30_great']},

}


symmetries_and_views = {
    '4': ['default', 'cross', '1-fold', '2-fold_square', '2-fold_cross', '3-fold_violet', '3-fold_green'],
    '8': ['default', 'cross', '2-fold', '3-fold', '4-fold'],
    '20': ['default', '2-fold', '3-fold', '5-fold']
}


def render(scene_name, opt_str=''):
    symmetry = str(dict_of_scenes[scene_name]['sym'])
    element_names = dict_of_scenes[scene_name]['tpl']

    with open('IMAGE.pov', 'a') as image_pov:
        image_pov.write(template('wrapper_head'))

        for element_name in element_names:
            image_pov.write(template(element_name))

        image_pov.write(template('wrapper_foot'))

    for view in symmetries_and_views[symmetry]:
        variables['view'] = symmetry + '-hedral_' + view

        with open('VARIABLES.inc', 'a') as variables_inc:
            variables_inc.write(template('variables', variables))

        view_str = ',_' + view if view != 'default' else ''

        size_str = ',_size_'
        if variables['scale'] == 'Small':
            size_str += 's'
        elif variables['scale'] == 'Medium':
            size_str += 'm'
        elif variables['scale'] == '1':  # one
            size_str += 'l'  # l for large

        image_name = 'Skeleton_' + scene_name + size_str + opt_str + view_str

        system('povray IMAGE.pov +ua +fn Height={size} Width={size} +O{name} -D'.format(size=image_size, name=image_name))
        system('rm VARIABLES.inc')
        system('mv {name}.png FILES'.format(name=image_name))

    system('rm IMAGE.pov')


########################################################################################################################


skeletonic_single = [
    '4a', '4b', '6', '8', '12', '20',
    'Gr12', 'St12', 'Gr20', 'GrSt12'
]
skeletonic_pairs = [
    'pair_4-4', 'pair_6-8', 'pair_12-20',
    'pair_Gr12_and_dual', 'pair_Gr20_and_dual',
    'pair_12_and_greatening', 'pair_20_and_greatening', 'pair_St12_and_greatening'
]
skeletonic_pairs_petrie = [
    'pair_4-4,_Petrie', 'pair_6-8,_Petrie', 'pair_12-20,_Petrie',
    'pair_Gr12_and_dual,_Petrie', 'pair_Gr20_and_dual,_Petrie'
]

rhombic = ['rhombic_30_convex', 'rhombic_30_medial', 'rhombic_30_great']

stick_single = [
    '4a,_Petrie,_stick', '4b,_Petrie,_stick', '6,_Petrie,_stick', '8,_Petrie,_stick', '12,_Petrie,_stick', '20,_Petrie,_stick',
    'Gr12,_Petrie,_stick', 'St12,_Petrie,_stick', 'Gr20,_Petrie,_stick', 'GrSt12,_Petrie,_stick'
]
stick_pairs = [
    'pair_4-4,_Petrie,_stick', 'pair_6-8,_Petrie,_stick', 'pair_12-20,_Petrie,_stick',
    'pair_Gr12_and_dual,_Petrie,_stick', 'pair_Gr20_and_dual,_Petrie,_stick'
]

########################################################################################################################

# Examples of some images and the commands that will render them:

# https://commons.wikimedia.org/wiki/File:Skeleton_GrSt12,_size_s.png etc.
variables = {'scale': 'Small', 'offset': 'Thick', 'sphere': 'false', 'lighten': 'false'}
for scene in skeletonic_single:
    render(scene)

# https://commons.wikimedia.org/wiki/File:Skeleton_pair_Gr20_and_dual,_Petrie,_size_s.png etc.
variables = {'scale': 'Small', 'offset': 'Thin', 'sphere': 'false', 'lighten': 'true'}
for scene in skeletonic_pairs_petrie:
    render(scene)

# https://commons.wikimedia.org/wiki/File:Skeleton_pair_Gr12_and_dual,_Petrie,_stick,_size_m.png etc.
variables = {'scale': 'Medium', 'offset': 'Thin', 'sphere': 'true', 'lighten': 'false'}
for scene in skeletonic_pairs:
    render(scene)

# https://commons.wikimedia.org/wiki/File:Rhombic_triacontahedron_1_(convex),_size_l.png
variables = {'scale': '1', 'offset': 'Thick', 'sphere': 'false', 'lighten': 'false'}
render('rhombic_30_convex')

# `offset` and `lighten` apply only to skeletonic solids. `lighten` applies only to the K-P solids.
# In other cases the passed values are irrelevant, but have to be passed anyway.
