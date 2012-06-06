class Entry < ActiveRecord::Base
  belongs_to :diary
  attr_accessible :comments, :date, :responsible, :subject, :entry_type

  validates :date, presence: true
  validates :subject, presence: true
  validates :responsible, presence: true
  
  TYPES = {p_projecte: "Planificacio de Projecte", p_temporal: "Planificacio temporal",
           mod_projectuals: "Modificacions projectuals", rel_colabs: "Relacio amb col.laboradors", 
           verif_lliurament: "Verificacio lliurament col.laborador", rel_client: "Relacio amb el client", 
           mod_contractuals: "Modificacions contracturals", rev_projecte: "Revisio projecte", 
           verif_projecte: "Verificacio projecte", valid_projecte: "Validacio projecte", 
           lliurament: "Lliurament", punts_critics: "Punts critics", no_conformitat: "No conformitat", 
           reunio: "Reunio", altres: "Altres"}

  default_scope order: 'entries.date DESC'
end
