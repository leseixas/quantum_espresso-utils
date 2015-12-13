#!/usr/bin/env julia

##
# Parameterize k paths in N points
#
#    Author: Leandro Seixas <seixasle@gmail.com>
#            MackGraphe - Graphene and Nanomaterials Research Center
#            Mackenzie Presbyterian University
#            Sao Paulo, SP, Brazil
#

###########
#  INPUT  #
###########


  k_paths = Any[
                 Any[ [ 0.5, 0.0, 0.0 ], [ 2/3, 1/3, 0.0 ],   50 ],
                 Any[ [ 2/3, 1/3, 0.0 ], [ 0.0, 0.0, 0.0 ],   50 ],
                 Any[ [ 0.0, 0.0, 0.0 ], [ 0.5, 0.0, 0.0 ],   50 ]
                 ]


##########
#  LIBS  #
##########

  parameterize( ks::Array ) = [ (1.0 - x/ks[3])*ks[1] + (x/ks[3])*ks[2] for x=0:ks[3] ]

  k_crystal = mapreduce(parameterize, vcat, k_paths)

  n_k = length(k_crystal)
  weight = 1/n_k

  @printf("%3i\n",n_k)
  for i=1:n_k
   @printf("%12.8f%12.8f%12.8f%14.8f\n", k_crystal[i][1], k_crystal[i][2], k_crystal[i][3], weight)
  end

