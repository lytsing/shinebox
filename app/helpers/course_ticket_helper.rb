module CourseTicketHelper
  def init_tickets(course)
    tickets = course.tickets.select([:id, :name, :price_in_cents, :require_invoice, :description]).to_a
    tickets.map! do |ticket|
      item = ticket.as_json(methods: 'price')
      item[:quantity] = 0
      item
    end
    options = { tickets: tickets }
    options.to_ng_init
  end
end
