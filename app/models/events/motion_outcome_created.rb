class Events::MotionOutcomeCreated < Event
  def self.publish!(motion, user)
    create(kind: "motion_outcome_created",
           eventable: motion,
           discussion: motion.discussion,
           user: user).tap { |e| EventBus.broadcast('motion_outcome_created_event', e) }
  end

  def motion
    eventable
  end

  def discussion
    eventable.discussion
  end
end
