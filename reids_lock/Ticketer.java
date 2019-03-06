package com.xx.redis;

public class Ticketer {
	volatile int ticket = 100;

	public int getTicket() {
		return ticket;
	}

	public void setTicket() {
		this.ticket = ticket - 10;
	}

	public static void main(String[] args) throws InterruptedException {
		Ticketer ticketer = new Ticketer();

		Service lock = new Service();

		for (int i = 0; i < 100; i++) {

			new Thread(new Runnable() {
				@Override
				public void run() {
					// synchronized (ticketer) {
					DistributedLock lock2 = lock.getLock();
					String indentifier = lock2.lockWithTimeout("resource", 5000, 1000);
					try {
						if (ticketer.getTicket() > 0) {
							try {
								Thread.sleep(1);
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
							ticketer.setTicket();
							System.out.println(Thread.currentThread().getName() + ticketer.getTicket());
						} else {
							// System.out.println("============");
							try {
								Thread.currentThread().join();
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
						}
					} finally {

						// lock2.releaseLock(lockName, identifier)
						lock2.releaseLock("resource", indentifier);
					}
				}

			}, "第" + i + "个窗口=").start();

		}

	}
}
